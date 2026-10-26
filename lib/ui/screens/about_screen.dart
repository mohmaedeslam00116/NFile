import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/app_version.dart';
import '../../core/icon_fonts/broken_icons.dart';
import '../../l10n/app_localizations.dart';

class AboutOpenFileScreen extends StatelessWidget {
  const AboutOpenFileScreen({super.key});

  Future<void> _launchUrl(BuildContext context, String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).couldNotOpenLink(urlString))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // AMOLED or normal backgrounds
    final scaffoldBg = theme.scaffoldBackgroundColor;
    final cardBg = isDark
        ? Colors.white.withValues(alpha: 0.04)
        : Colors.black.withValues(alpha: 0.03);
    final borderCol = isDark
        ? Colors.white.withValues(alpha: 0.08)
        : Colors.black.withValues(alpha: 0.08);

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Elegant transparent App Bar
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: scaffoldBg.withValues(alpha: 0.9),
            iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                AppLocalizations.of(context).aboutNFile,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: theme.colorScheme.onSurface,
                  fontFamily: 'LexendDeca',
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),

          // Scrollable content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ── Beautiful App Icon with Double Ring Glowing Gradients ──
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer soft glowing ring
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              theme.colorScheme.primary.withValues(alpha: 0.2),
                              theme.colorScheme.secondary.withValues(alpha: 0.0),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      // Middle ring gradient
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              theme.colorScheme.primary.withValues(alpha: 0.4),
                              theme.colorScheme.secondary.withValues(alpha: 0.1),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      // Inner content container showing App Icon
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDark ? const Color(0xFF121212) : Colors.white,
                          border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.4), width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withValues(alpha: 0.25),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/ic_launcher.webp',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback icon in case asset load fails
                                return Icon(
                                  Broken.folder_open,
                                  color: theme.colorScheme.primary,
                                  size: 40,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ── App Title & Dynamic Badges ──
                  Text(
                    'OpenFile',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      fontFamily: 'LexendDeca',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
                    ),
                    child: Text(
                      AppLocalizations.of(context).appVersionWithChannel(
                        AppVersion.current,
                        AppLocalizations.of(context).releaseChannel,
                      ),
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LexendDeca',
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Description Card ──
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: borderCol),
                    ),
                    child: Text(
                      AppLocalizations.of(context).aboutDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
                        fontSize: 14.5,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // ── Beautiful Features Grid ──
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        AppLocalizations.of(context).coreHighlights,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                          fontFamily: 'LexendDeca',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.3,
                    children: [
                      _buildFeatureTile(
                        context,
                        icon: Broken.flash,
                        title: AppLocalizations.of(context).extremeSpeed,
                        subtitle: AppLocalizations.of(context).statelessCaching,
                      ),
                      _buildFeatureTile(
                        context,
                        icon: Broken.lock,
                        title: AppLocalizations.of(context).vaultSecure,
                        subtitle: AppLocalizations.of(context).encryptedWorkspace,
                      ),
                      _buildFeatureTile(
                        context,
                        icon: Broken.wifi_square,
                        title: AppLocalizations.of(context).serversHub,
                        subtitle: 'FTP, LAN, SFTP & WebDAV',
                      ),
                      _buildFeatureTile(
                        context,
                        icon: Broken.magicpen,
                        title: AppLocalizations.of(context).richUi,
                        subtitle: AppLocalizations.of(context).amoledBlack,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // ── Socials / Actions Section ──
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        AppLocalizations.of(context).connectAndShare,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                          fontFamily: 'LexendDeca',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildSocialAction(
                    context,
                    icon: Broken.magic_star,
                    label: AppLocalizations.of(context).starOnRepository,
                    onTap: () => _launchUrl(context, 'https://github.com/mohmaedeslam00116/OpenFile'),
                  ),
                  const SizedBox(height: 10),
                  _buildSocialAction(
                    context,
                    icon: Icons.send_rounded,
                    label: AppLocalizations.of(context).joinTelegramChannel,
                    onTap: () => _launchUrl(context, 'https://t.me/NFiley'),
                  ),
                  const SizedBox(height: 10),
                  _buildSocialAction(
                    context,
                    icon: Broken.send,
                    label: AppLocalizations.of(context).shareAppWithFriends,
                    onTap: () {
                      SharePlus.instance.share(ShareParams(
                        text: AppLocalizations.of(context).shareAppMessage(
                          'https://github.com/mohmaedeslam00116/OpenFile/releases',
                        ),
                        subject: AppLocalizations.of(context).appTagline,
                      ));
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildSocialAction(
                    context,
                    icon: Icons.code_rounded,
                    label: AppLocalizations.of(context).exploreSourceCode,
                    onTap: () => _launchUrl(context, 'https://github.com/mohmaedeslam00116/OpenFile'),
                  ),

                  const SizedBox(height: 48),

                  // ── Elegant Footer Tribute ──
                  Text(
                    AppLocalizations.of(context).madeWithLove,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                      fontFamily: 'LexendDeca',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(context).copyrightNotice,
                    style: TextStyle(
                      fontSize: 11,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardBg = isDark
        ? Colors.white.withValues(alpha: 0.03)
        : Colors.black.withValues(alpha: 0.02);
    final borderCol = isDark
        ? Colors.white.withValues(alpha: 0.06)
        : Colors.black.withValues(alpha: 0.06);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderCol),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 24),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 10.5,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialAction(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardBg = isDark
        ? Colors.white.withValues(alpha: 0.03)
        : Colors.black.withValues(alpha: 0.02);
    final borderCol = isDark
        ? Colors.white.withValues(alpha: 0.06)
        : Colors.black.withValues(alpha: 0.06);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderCol),
          ),
          child: Row(
            children: [
              Icon(icon, color: theme.colorScheme.primary, size: 20),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
