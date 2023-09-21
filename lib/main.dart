import 'package:ana_muslim/resources/colors_manager.dart';
import 'package:ana_muslim/resources/routes_manager.dart';
import 'package:ana_muslim/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorsManager.primaryBackgroundColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      home: const SplashScreen(),
    );
  }
}
