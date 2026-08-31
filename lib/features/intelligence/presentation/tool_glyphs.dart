/// The mark for each tool, and the tone it carries.
///
/// **No sparkles and no robots.** Every glyph here describes what the tool does
/// to your material — reads it, questions it, compares it, shields it — rather
/// than announcing that a model is involved. A tool that finds a deadline is a
/// calendar. Marking all fifteen with a wand would tell the user the only thing
/// they already assumed and none of the thing they need to choose between.
library;

import 'package:flutter/material.dart';

import '../../../design/tokens/colors.dart';
import '../domain/intelligence_tool.dart';

IconData iconForGlyph(ToolGlyph glyph) => switch (glyph) {
      ToolGlyph.document => Icons.description_outlined,
      ToolGlyph.question => Icons.help_outline_rounded,
      ToolGlyph.summary => Icons.short_text_rounded,
      ToolGlyph.compare => Icons.compare_arrows_rounded,
      ToolGlyph.goal => Icons.flag_outlined,
      ToolGlyph.plan => Icons.account_tree_outlined,
      ToolGlyph.checklist => Icons.checklist_rounded,
      ToolGlyph.gap => Icons.search_off_rounded,
      ToolGlyph.rewrite => Icons.edit_note_rounded,
      ToolGlyph.reply => Icons.reply_rounded,
      ToolGlyph.translate => Icons.translate_rounded,
      ToolGlyph.table => Icons.table_chart_outlined,
      ToolGlyph.deadline => Icons.event_outlined,
      ToolGlyph.shield => Icons.shield_outlined,
      ToolGlyph.provenance => Icons.verified_outlined,
      ToolGlyph.credential => Icons.key_outlined,
      ToolGlyph.link => Icons.link_rounded,
    };

/// The category's own mark, for the section header.
IconData iconForCategory(IntelligenceCategory category) => switch (category) {
      IntelligenceCategory.understand => Icons.menu_book_outlined,
      IntelligenceCategory.plan => Icons.route_outlined,
      IntelligenceCategory.create => Icons.draw_outlined,
      IntelligenceCategory.extract => Icons.content_cut_rounded,
      IntelligenceCategory.verify => Icons.gpp_good_outlined,
    };

/// One hue per category, so a tool's mark says which family it belongs to
/// before its title is read.
///
/// Drawn from the existing palette rather than a new set — the confidence
/// family is already the app's "how sure are we" language, which is exactly the
/// axis these five intents sit on.
Color colourForCategory(IntelligenceCategory category, AppColors colors) =>
    switch (category) {
      IntelligenceCategory.understand => colors.confidenceHigh,
      IntelligenceCategory.plan => colors.brand,
      IntelligenceCategory.create => colors.confidenceReview,
      IntelligenceCategory.extract => colors.urgencyImportant,
      IntelligenceCategory.verify => colors.confidenceConfirmed,
    };
