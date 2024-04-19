import 'package:flutter/material.dart';
import 'package:projects/providers/cart_provider.dart';
import 'package:projects/providers/dark_theme_provider.dart';
import 'package:projects/screens/menu_screen.dart';
import 'package:projects/screens/post_screen.dart';
import 'package:projects/screens/settings_screen.dart';
import 'package:projects/utlis/theme.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => themeChangeProvider),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          theme: basicTheme(themeChangeProvider.darkTheme, context),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const MenuScreen(),
            '/posts': (context) => const PostScreen(),
            '/settings': (context) => const SettingsScreen(),
          },
        );
      }),
    );
  }
}
