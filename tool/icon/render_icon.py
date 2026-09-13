"""Renders Action's launcher icon, its adaptive layers and the splash glyph.

The mark: a focus ring that opens on the right, with a forward arrow leaving
through the opening. Focus, then the next step — the whole product in one
gesture. Two colours, no text, no checkbox, and a silhouette that survives a
24 px launcher slot because the ring is thick and the gap is wide.

Outputs (all written into assets/, consumed by flutter_launcher_icons and
flutter_native_splash at generation time — none is bundled into the APK):

    assets/icon/icon.png             1024²  legacy launcher / iOS: mark on a
                                            rounded brand-blue tile
    assets/icon/icon_foreground.png  1024²  adaptive foreground, transparent,
                                            drawn at 85% so the mark stays
                                            inside the launcher's safe zone
    assets/icon/icon_monochrome.png  1024²  adaptive monochrome (Android 13+
                                            themed icons): the same mark, white
    assets/splash/splash.png         1152²  the mark alone, for the splash

Everything is drawn at 4× and downsampled, which is what gives the edges
their anti-aliasing. Run from the repository root:

    python tool/icon/render_icon.py
    dart run flutter_launcher_icons
    dart run flutter_native_splash:create
"""

from __future__ import annotations

import math
import os

from PIL import Image, ImageDraw

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
BRAND = (0x25, 0x63, 0xEB, 255)
WHITE = (255, 255, 255, 255)
SUPERSAMPLE = 4


def draw_mark(draw: ImageDraw.ImageDraw, cx: float, cy: float, r: float, ink):
    """The focus ring and the arrow, scaled so the ring's outer radius is r."""
    stroke = r * 0.26
    ring_r = r - stroke / 2  # centreline radius
    gap_half_deg = 50  # the opening, either side of the arrow's axis

    # The ring. PIL draws an arc's width inward from its bounding box, so the
    # box is the outer edge and the centreline lands at ring_r. Arcs run
    # clockwise from 3 o'clock in image space; the gap sits astride 0°.
    box = [cx - r, cy - r, cx + r, cy + r]
    draw.arc(box, start=gap_half_deg, end=360 - gap_half_deg, fill=ink, width=int(round(stroke)))

    # Round the arc's two ends so they read as one continuous stroke rather
    # than a cut pipe. Centred on the centreline, so they sit flush.
    for ang in (gap_half_deg, -gap_half_deg):
        a = math.radians(ang)
        ex, ey = cx + ring_r * math.cos(a), cy + ring_r * math.sin(a)
        draw.ellipse([ex - stroke / 2, ey - stroke / 2, ex + stroke / 2, ey + stroke / 2], fill=ink)

    # The arrow: a short shaft from left of centre and a large head whose tip
    # stops at the ring's outer edge, leaving through the opening with clear
    # air on both sides.
    shaft_w = stroke
    x0 = cx - r * 0.30
    tip = cx + r * 0.98
    head_len = r * 0.46
    head_half = r * 0.36
    x_head = tip - head_len
    draw.line([(x0, cy), (x_head + r * 0.04, cy)], fill=ink, width=int(round(shaft_w)))
    draw.ellipse([x0 - shaft_w / 2, cy - shaft_w / 2, x0 + shaft_w / 2, cy + shaft_w / 2], fill=ink)
    draw.polygon([(x_head, cy - head_half), (tip, cy), (x_head, cy + head_half)], fill=ink)


def render(size: int, *, background, mark_scale: float, ink, corner_radius: float = 0.0) -> Image.Image:
    s = size * SUPERSAMPLE
    img = Image.new("RGBA", (s, s), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    if background is not None:
        if corner_radius > 0:
            draw.rounded_rectangle([0, 0, s - 1, s - 1], radius=corner_radius * s, fill=background)
        else:
            draw.rectangle([0, 0, s - 1, s - 1], fill=background)
    draw_mark(draw, s / 2, s / 2, (s / 2) * mark_scale, ink)
    return img.resize((size, size), Image.LANCZOS)


def main() -> None:
    icon_dir = os.path.join(ROOT, "assets", "icon")
    splash_dir = os.path.join(ROOT, "assets", "splash")
    os.makedirs(icon_dir, exist_ok=True)
    os.makedirs(splash_dir, exist_ok=True)

    # Legacy / iOS: the mark fills 62% of the tile, on a rounded blue square.
    render(1024, background=BRAND, mark_scale=0.62, ink=WHITE, corner_radius=0.22).save(
        os.path.join(icon_dir, "icon.png")
    )
    # Adaptive foreground: transparent, the mark at 85% of the safe-zone
    # arithmetic flutter_launcher_icons expects (it insets a further 16%).
    render(1024, background=None, mark_scale=0.62 * 0.85, ink=WHITE).save(
        os.path.join(icon_dir, "icon_foreground.png")
    )
    render(1024, background=None, mark_scale=0.62 * 0.85, ink=WHITE).save(
        os.path.join(icon_dir, "icon_monochrome.png")
    )
    # Splash: the mark alone at half the canvas; Android 12's splash draws it
    # inside its own circle and needs the outer third clear.
    render(1152, background=None, mark_scale=0.50, ink=WHITE).save(
        os.path.join(splash_dir, "splash.png")
    )
    print("rendered icon.png, icon_foreground.png, icon_monochrome.png, splash.png")


if __name__ == "__main__":
    main()
