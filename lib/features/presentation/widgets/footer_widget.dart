// lib/features/presentation/widgets/footer_widget.dart

import 'package:flutter/material.dart';
import 'package:paksimapp/core/constants/app_constants.dart';
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
    // Get the current theme data
    final theme = Theme.of(context);

    return Container(
      // No background color needed for the final version
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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

          Text(
            'Version ${AppConstants.appVersion}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}