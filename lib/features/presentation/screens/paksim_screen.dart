import 'package:flutter/material.dart';
import 'package:paksimapp/core/theme/theme_controller.dart';
import 'package:paksimapp/features/data/services/check_update_service.dart'; // Import service
import 'package:paksimapp/features/presentation/controllers/paksim_controller.dart';
import 'package:paksimapp/features/presentation/widgets/dialog/sim_data_dialog.dart';
import 'package:paksimapp/features/presentation/widgets/dialog/update_dialog.dart'; // Import dialog
import 'package:paksimapp/features/presentation/widgets/form/paksim_form_widget.dart';
import 'package:paksimapp/features/presentation/widgets/footer_widget.dart';

class PakSimScreen extends StatefulWidget {
  const PakSimScreen({super.key});

  @override
  State<PakSimScreen> createState() => _PakSimScreenState();
}

class _PakSimScreenState extends State<PakSimScreen> {
  final pakSimController = PakSimController();

  @override
  void initState() {
    super.initState();
    // Run the update check shortly after the app starts
    Future.delayed(const Duration(seconds: 2), _checkForUpdate);
  }

  Future<void> _checkForUpdate() async {
    final updateService = CheckUpdateService();
    final updateInfo = await updateService.checkForUpdate();
    if (updateInfo != null && mounted) {
      showUpdateDialog(context, updateInfo.latestVersion, updateInfo.downloadUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    // The rest of your build method remains the same
    return ValueListenableBuilder<PakSimState>(
      valueListenable: pakSimController,
      builder: (context, state, _) {
        if (state is PakSimSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSimDataDialog(context, state.results);
            pakSimController.reset();
          });
        }

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
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: PakSimFormWidget(
                      onSearchPressed: pakSimController.search,
                      isLoading: isLoading,
                      errorMessage: errorMessage,
                    ),
                  ),
                ),
                const FooterWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}