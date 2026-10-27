import 'dart:ui';

/// The direction a run of text reads.
///
/// The interface reads from the right in Arabic, but the text itself keeps the
/// direction it is written in: a Latin file name or a size reads left to right,
/// an Arabic name reads right to left. The first strong letter decides, and a
/// run without a letter (numbers, punctuation) reads left to right.
TextDirection textDirectionOf(String text) {
  for (final rune in text.runes) {
    if (_isLatinLetter(rune)) return TextDirection.ltr;
    if (_isArabicLetter(rune)) return TextDirection.rtl;
  }
  return TextDirection.ltr;
}

/// The alignment that keeps a run of text on the edge where the interface starts.
///
/// A name written against the direction of the interface (a Latin name in an
/// Arabic screen, an Arabic name in an English screen) still belongs to the
/// same edge: its end is aligned to that edge, so the name does not jump to the
/// other side of the row.
TextAlign textAlignFor(
  TextDirection textDirection,
  TextDirection interfaceDirection,
) =>
    textDirection == interfaceDirection ? TextAlign.start : TextAlign.end;

bool _isLatinLetter(int rune) =>
    (rune >= 0x0041 && rune <= 0x005A) ||
    (rune >= 0x0061 && rune <= 0x007A) ||
    (rune >= 0x00C0 && rune <= 0x024F);

bool _isArabicLetter(int rune) =>
    (rune >= 0x0600 && rune <= 0x06FF) ||
    (rune >= 0x0750 && rune <= 0x077F) ||
    (rune >= 0x08A0 && rune <= 0x08FF) ||
    (rune >= 0xFB50 && rune <= 0xFDFF) ||
    (rune >= 0xFE70 && rune <= 0xFEFF);
