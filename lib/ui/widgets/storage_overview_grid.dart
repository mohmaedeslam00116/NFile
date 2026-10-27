import 'package:flutter/material.dart';

import '../../core/icon_fonts/broken_icons.dart';
import '../../core/l10n/volume_labels.dart';
import '../../core/utils.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/file_manager_provider.dart';

/// The storage overview of the home screen.
///
/// One volume fills the width of the screen. Two or more volumes sit side by
/// side, two per row, so the user sees every volume without swiping. A last
/// odd card spans the row on its own.
class StorageOverviewGrid extends StatelessWidget {
  final List<StorageVolume> volumes;
  final ValueChanged<String> onBrowseVolume;
  final ValueChanged<StorageVolume>? onAnalyzeVolume;

  const StorageOverviewGrid({
    super.key,
    required this.volumes,
    required this.onBrowseVolume,
    this.onAnalyzeVolume,
  });

  static const double _gap = 12;
  static const double _horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    if (volumes.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _horizontalPadding,
          vertical: 4,
        ),
        child: _StorageSkeleton(),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _horizontalPadding,
        vertical: 4,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final fullWidth = constraints.maxWidth;
          final halfWidth = (fullWidth - _gap) / 2;

          return Wrap(
            spacing: _gap,
            runSpacing: _gap,
            children: [
              for (var index = 0; index < volumes.length; index++)
                SizedBox(
                  key: ValueKey('storage-card-${volumes[index].path}'),
                  width: volumes.length == 1 ||
                          (index == volumes.length - 1 && volumes.length.isOdd)
                      ? fullWidth
                      : halfWidth,
                  child: StorageVolumeCard(
                    volume: volumes[index],
                    compact: volumes.length > 1,
                    onTap: () => onBrowseVolume(volumes[index].path),
                    onLongPress: onAnalyzeVolume == null
                        ? null
                        : () => onAnalyzeVolume!(volumes[index]),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

/// One volume: its name, its path, how full it is, and its free and total space.
class StorageVolumeCard extends StatelessWidget {
  final StorageVolume volume;
  final bool compact;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const StorageVolumeCard({
    super.key,
    required this.volume,
    this.compact = false,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    final totalBytes = volume.totalBytes;
    final usedBytes = volume.usedBytes.clamp(0, totalBytes);
    final freeBytes = totalBytes - usedBytes;
    final usedPercentage = totalBytes > 0 ? usedBytes / totalBytes : 0.0;

    final freeText = FileUtils.formatBytes(freeBytes, 2);
    final totalText = FileUtils.formatBytes(totalBytes, 2);

    final gradientColors = _gradientFor(volume, theme, isDark);
    final accentColor = _accentFor(volume, theme, isDark);
    final iconData = _iconFor(volume);

    final iconSize = compact ? 38.0 : 50.0;
    final titleSize = compact ? 13.5 : 16.0;
    final pathSize = compact ? 9.5 : 11.5;
    final progressHeight = compact ? 6.0 : 8.0;

    final iconBackground = isDark
        ? accentColor.withValues(alpha: 0.15)
        : Colors.white.withValues(alpha: 0.25);
    final iconBorder = isDark
        ? accentColor.withValues(alpha: 0.3)
        : Colors.white.withValues(alpha: 0.4);
    final progressBackground = isDark
        ? Colors.white.withValues(alpha: 0.12)
        : Colors.white.withValues(alpha: 0.3);

    return Container(
      height: compact ? 164 : 152,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: BorderRadius.circular(24),
          splashColor: Colors.white.withValues(alpha: 0.15),
          highlightColor: Colors.white.withValues(alpha: 0.08),
          child: Padding(
            padding: EdgeInsets.all(compact ? 14 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        color: iconBackground,
                        borderRadius: BorderRadius.circular(compact ? 14 : 16),
                        border: Border.all(color: iconBorder),
                      ),
                      child: Icon(
                        iconData,
                        color: accentColor,
                        size: compact ? 22 : 26,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            volumeLabel(l10n, volume),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: titleSize,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.2,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            volume.path,
                            textDirection: TextDirection.ltr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: pathSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: usedPercentage,
                    backgroundColor: progressBackground,
                    valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                    minHeight: progressHeight,
                  ),
                ),
                SizedBox(height: compact ? 10 : 8),
                Row(
                  children: [
                    Expanded(
                      child: _StorageStat(
                        value: freeText,
                        label: l10n.storageFreeLabel,
                        compact: compact,
                      ),
                    ),
                    Expanded(
                      child: _StorageStat(
                        value: totalText,
                        label: l10n.storageTotalLabel,
                        compact: compact,
                        alignToEnd: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Color> _gradientFor(
    StorageVolume volume,
    ThemeData theme,
    bool isDark,
  ) {
    if (volume.isInternal) {
      return isDark
          ? [
              Color.alphaBlend(
                theme.colorScheme.primary.withValues(alpha: 0.30),
                const Color(0xFF181818),
              ),
              Color.alphaBlend(
                theme.colorScheme.primary.withValues(alpha: 0.12),
                const Color(0xFF0C0C0C),
              ),
            ]
          : [
              theme.colorScheme.primary,
              theme.colorScheme.primary.withValues(alpha: 0.82),
            ];
    }

    if (volume.name.toUpperCase().contains('SD')) {
      return isDark
          ? const [Color(0xFF312E81), Color(0xFF1E1B4B)]
          : const [Color(0xFF4F46E5), Color(0xFF4338CA)];
    }

    return isDark
        ? const [Color(0xFF115E59), Color(0xFF0F4C46)]
        : const [Color(0xFF0D9488), Color(0xFF0F766E)];
  }

  Color _accentFor(StorageVolume volume, ThemeData theme, bool isDark) {
    if (volume.isInternal) return isDark ? theme.colorScheme.primary : Colors.white;
    if (volume.name.toUpperCase().contains('SD')) {
      return isDark ? const Color(0xFF818CF8) : Colors.white;
    }
    return isDark ? const Color(0xFF2DD4BF) : Colors.white;
  }

  IconData _iconFor(StorageVolume volume) {
    if (volume.isInternal) return Broken.folder_2;
    if (volume.name.toUpperCase().contains('SD')) return Icons.sd_storage_rounded;
    return Icons.usb_rounded;
  }
}

class _StorageStat extends StatelessWidget {
  final String value;
  final String label;
  final bool compact;
  final bool alignToEnd;

  const _StorageStat({
    required this.value,
    required this.label,
    required this.compact,
    this.alignToEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignToEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          value,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.white,
            fontSize: compact ? 13 : 13.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.72),
            fontSize: compact ? 9.5 : 10.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _StorageSkeleton extends StatelessWidget {
  const _StorageSkeleton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: 152,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.05)
              : theme.colorScheme.primary.withValues(alpha: 0.08),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 140,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 90,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
