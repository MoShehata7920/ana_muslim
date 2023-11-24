import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ana_muslim/provider/bookmark_provider.dart';
import 'package:ana_muslim/provider/sebha_provider.dart';
import 'package:ana_muslim/provider/theme_provider.dart';
import 'package:ana_muslim/resources/routes_manager.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/resources/theme_data.dart';
import 'package:ana_muslim/screens/splash_screen/splash_screen.dart';

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
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            SharedPreferences prefs = snapshot.data!;
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<ThemeProvider>(
                  create: (_) => themeChangeProvider,
                ),
                ChangeNotifierProvider<SebhaProvider>(
                  create: (_) => SebhaProvider(),
                ),
                ChangeNotifierProvider<BookmarkData>(
                  create: (_) {
                    var bookmarkData = BookmarkData(prefs);
                    bookmarkData.initializePrefs();
                    return bookmarkData;
                  },
                ),
              ],
              child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, snapshot) {
                  return MaterialApp(
                    theme: MyThemeData.themeData(
                        themeProvider.getDarkTheme, context),
                    debugShowCheckedModeBanner: false,
                    onGenerateRoute: RouteGenerator.getRoute,
                    initialRoute: Routes.splashRoute,
                    home: const SplashScreen(),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            final logger = Logger();
            logger.e(snapshot.error);
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: Color(0xFF00001a),
                body: Center(
                  child: Text(
                    AppStrings.errorOccurred,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
