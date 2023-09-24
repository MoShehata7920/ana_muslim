import 'package:ana_muslim/provider/theme_provider.dart';
import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/screens/splash_screen/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeProvider>(context).getDarkTheme;

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                isDarkTheme
                    ? ImageAssets.darkBackground
                    : ImageAssets.mainBackground,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: const SplashViewBody()),
    );
  }
}
