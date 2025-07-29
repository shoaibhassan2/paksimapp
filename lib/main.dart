import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paksimapp/core/theme/app_theme.dart';
import 'package:paksimapp/core/theme/theme_controller.dart';
import 'package:paksimapp/features/presentation/screens/paksim_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load theme first before running the app
  await themeController.ensureInitialized();

  // Set edge-to-edge UI
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));

  runApp(const PakSimApp());
}

class PakSimApp extends StatelessWidget {
  const PakSimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeController,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'Pak SIM Info',
          debugShowCheckedModeBanner: false,
          theme: lightAppTheme,
          darkTheme: darkAppTheme,
          themeMode: mode,
          home: const PakSimScreen(),
        );
      },
    );
  }
}
