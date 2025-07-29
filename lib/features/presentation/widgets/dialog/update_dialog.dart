// lib/features/presentation/widgets/dialog/update_dialog.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void showUpdateDialog(BuildContext context, String newVersion, String downloadUrl) {
  final theme = Theme.of(context);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: theme.dialogBackgroundColor,
        title: Text(
          'Update Available!',
          style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.primary),
        ),
        content: Text(
          'A new version ($newVersion) is available. Please update for the latest features.',
          style: theme.textTheme.bodyLarge,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Later', style: TextStyle(color: theme.textTheme.bodyMedium?.color)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary),
            onPressed: () async {
              final url = Uri.parse(downloadUrl);
              await launchUrl(url, mode: LaunchMode.externalApplication);
              Navigator.of(context).pop();
            },
            child: const Text('Update Now', style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}