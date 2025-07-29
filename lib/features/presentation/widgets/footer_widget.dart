import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://github.com/shoaibhassan2/paksimapp');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Clickable creator credit
          InkWell(
            onTap: _launchURL,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                'Created by Shoaib Hassan',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),

          // FutureBuilder to get and display the app version
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              String versionText = '...';
              if (snapshot.hasData) {
                versionText = 'Version ${snapshot.data!.version}';
              }
              return Text(
                versionText,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}