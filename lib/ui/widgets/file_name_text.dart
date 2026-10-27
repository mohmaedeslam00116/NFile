import 'package:flutter/material.dart';

import '../../core/l10n/bidi.dart';

/// The name of a file or folder, read in the direction it is written.
///
/// A Latin name in an Arabic screen keeps its beginning visible and its end
/// is aligned to the edge where the screen starts; an Arabic name stays right
/// to left. The name never jumps to the other side of its row.
class FileNameText extends StatelessWidget {
  final String name;
  final TextStyle? style;
  final int maxLines;
  final TextOverflow overflow;

  const FileNameText(
    this.name, {
    super.key,
    this.style,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    final direction = textDirectionOf(name);
    return Text(
      name,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textDirection: direction,
      textAlign: textAlignFor(direction, Directionality.of(context)),
    );
  }
}
