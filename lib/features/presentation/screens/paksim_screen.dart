// lib/features/presentation/screens/paksim_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paksimapp/core/theme/theme_controller.dart';
import 'package:paksimapp/features/presentation/controllers/paksim_controller.dart';
import 'package:paksimapp/features/presentation/widgets/dialog/sim_data_dialog.dart';
import 'package:paksimapp/features/presentation/widgets/form/paksim_form_widget.dart';

class PakSimScreen extends StatelessWidget {
  const PakSimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize your controller here.
    final pakSimController = PakSimController();

    return ValueListenableBuilder<PakSimState>(
      valueListenable: pakSimController,
      builder: (context, state, _) {
        // Show the dialog when we get a success state
        if (state is PakSimSuccess) {
          // Use addPostFrameCallback to show dialog after the build is complete
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSimDataDialog(context, state.results);
            pakSimController.reset(); // Reset state after showing dialog
          });
        }

        // Determine loading and error states for the form widget
        final isLoading = state is PakSimLoading;
        final errorMessage = state is PakSimError ? state.message : null;

        return Scaffold(
          appBar: AppBar(
            title: Text('Pak SIM Data', style: Theme.of(context).textTheme.headlineSmall),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  key: ValueKey(Theme.of(context).brightness),
                  icon: Icon(
                    Theme.of(context).brightness == Brightness.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                  onPressed: () {
                    final isCurrentlyDark = Theme.of(context).brightness == Brightness.dark;
                    themeController.setTheme(
                      isCurrentlyDark ? ThemeMode.light : ThemeMode.dark,
                    );
                  },
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: PakSimFormWidget(
              // The onSearchPressed function now just calls our controller
              onSearchPressed: (phoneNumber) => pakSimController.search(phoneNumber),
              isLoading: isLoading,
              errorMessage: errorMessage,
            ),
          ),
        );
      },
    );
  }
}