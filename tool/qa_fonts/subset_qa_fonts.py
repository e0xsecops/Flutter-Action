"""Builds the test-only fonts under test/fonts from the QA device's own fonts.

Why these fonts exist. `flutter test` renders every glyph with the FlutterTest
font, in which every code point — a Latin letter, a Thai tone mark, a Bengali
vowel sign — is a 1 em square. That makes "does this label fit?" unanswerable
in a widget test: "Bibliothèque" measures 12 em when Roboto draws it in about
6, and a Thai label with five combining marks measures nearly twice its real
width. The nav-label regression test therefore shapes text with the fonts the
QA emulator actually renders with: Roboto for Latin and Cyrillic, and the Noto
faces Android falls back to for every other script Action ships.

Why they are subsets. The full Noto Sans CJK collection is 32 MB. Each face
here is cut down to the characters that occur anywhere in lib/l10n/*.arb, so
a label made of app strings always shapes with real glyphs. A glyph that is
missing from a subset renders as the face's .notdef box, which is *wider* than
almost any real glyph — the failure mode is a spurious overflow, never a
spurious pass — and the test names this script in its message.

Regenerate when a locale's ARB gains characters outside the current subsets:

    adb -s emulator-5554 pull /system/fonts/<face> <src>/
    python tool/qa_fonts/subset_qa_fonts.py <src>

Licences: Roboto is Apache 2.0; the Noto faces are SIL OFL 1.1. Both licence
texts sit beside the fonts, as both licences require.
"""

from __future__ import annotations

import glob
import json
import os
import sys

from fontTools import subset
from fontTools.ttLib import TTFont
from fontTools.varLib import instancer

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
OUT = os.path.join(ROOT, "test", "fonts")


def arb_characters() -> set[str]:
    chars: set[str] = set()
    for path in glob.glob(os.path.join(ROOT, "lib", "l10n", "app_*.arb")):
        with open(path, encoding="utf-8") as fh:
            data = json.load(fh)
        for key, value in data.items():
            if key.startswith("@") or not isinstance(value, str):
                continue
            chars.update(value)
    # The ellipsis the framework appends on overflow, and ASCII in full so a
    # test label containing punctuation the ARB happens not to use still
    # shapes rather than boxes.
    chars.add("…")
    chars.update(chr(c) for c in range(0x20, 0x7F))
    return chars


def instantiate(font: TTFont, wght: float) -> TTFont:
    axes = {a.axisTag: a for a in font["fvar"].axes}
    location = {"wght": wght}
    if "wdth" in axes:
        location["wdth"] = 100
    if "ital" in axes:
        location["ital"] = 0
    inst = instancer.instantiateVariableFont(font, location, inplace=False)
    inst["OS/2"].usWeightClass = int(wght)
    return inst


def write_subset(font: TTFont, unicodes: set[str], out_path: str) -> None:
    options = subset.Options()
    options.layout_features = ["*"]
    options.name_IDs = ["*"]
    options.hinting = False
    options.desubroutinize = True
    options.notdef_outline = True
    subsetter = subset.Subsetter(options)
    subsetter.populate(unicodes=[ord(c) for c in unicodes])
    subsetter.subset(font)
    font.save(out_path)
    print(f"{os.path.basename(out_path)}: {os.path.getsize(out_path) // 1024} KB")


def main(src: str) -> None:
    os.makedirs(OUT, exist_ok=True)
    chars = arb_characters()

    # Variable faces are pinned at the two weights the nav bar uses, because
    # the engine's dynamic font manager does not apply a variation axis for a
    # requested weight — it matches the nearest registered face.
    variable = {
        "Roboto-Regular.ttf": "Roboto",
        "NotoSansBengali-VF.ttf": "NotoSansBengali",
        "NotoSansDevanagari-VF.ttf": "NotoSansDevanagari",
    }
    for name, stem in variable.items():
        path = os.path.join(src, name)
        for wght in (500, 600):
            font = TTFont(path)
            inst = instantiate(font, wght)
            write_subset(inst, chars, os.path.join(OUT, f"{stem}-w{wght}.ttf"))

    static = [
        "NotoSansThai-Regular.ttf",
        "NotoSansThai-Bold.ttf",
        "NotoNaskhArabicUI-Regular.ttf",
        "NotoNaskhArabicUI-Bold.ttf",
    ]
    for name in static:
        write_subset(TTFont(os.path.join(src, name)), chars, os.path.join(OUT, name))

    # One CJK face serves Japanese, Korean and both Chinese scripts: the
    # regional faces differ in glyph *shape*, and every ideograph, kana and
    # hangul advances exactly 1 em in all of them, which is the only property
    # the width test reads.
    ttc = os.path.join(src, "NotoSansCJK-Regular.ttc")
    font = TTFont(ttc, fontNumber=0)
    write_subset(font, chars, os.path.join(OUT, "NotoSansCJK-Regular.otf"))


if __name__ == "__main__":
    main(sys.argv[1])
