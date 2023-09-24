import 'package:ana_muslim/provider/theme_provider.dart';
import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  Size get screenSize => MediaQuery.of(context).size;

  bool get isDarkTheme => Provider.of<ThemeProvider>(context).getDarkTheme;

  String get scaffoldBackgroundImage =>
      isDarkTheme ? ImageAssets.darkBackground : ImageAssets.mainBackground;

  Color get bottomNavBarColor =>
      isDarkTheme ? const Color(0xFF031A2E) : Colors.white38;
}
