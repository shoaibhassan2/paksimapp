// lib/features/presentation/widgets/dialog/sim_info_row.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const SimInfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: theme.iconTheme.color?.withOpacity(0.7), size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: theme.textTheme.bodyLarge, // Default style for the row
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
          // --- NEW: COPY BUTTON ---
          const SizedBox(width: 4),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: value));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$label copied to clipboard'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: const Icon(Icons.copy, size: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}