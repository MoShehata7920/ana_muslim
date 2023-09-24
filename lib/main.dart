import 'package:ana_muslim/provider/theme_provider.dart';
import 'package:ana_muslim/resources/routes_manager.dart';
import 'package:ana_muslim/resources/theme_data.dart';
import 'package:ana_muslim/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.themePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
      ],
      child:
          Consumer<ThemeProvider>(builder: (context, themeProvider, snapshot) {
        return MaterialApp(
          theme: MyThemeData.themeData(themeProvider.getDarkTheme, context),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashRoute,
          home: const SplashScreen(),
        );
      }),
    );
  }
}
