import 'package:flutter/material.dart';

import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/screens/adya/doaa/doaa_scree.dart';
import 'package:ana_muslim/screens/ahadeth/hadeth_screen/hadeth_screen.dart';
import 'package:ana_muslim/screens/bookmarks/bookmarks_screen.dart';
import 'package:ana_muslim/screens/home/home_screen.dart';
import 'package:ana_muslim/screens/quran/sura/sura.dart';
import 'package:ana_muslim/screens/splash_screen/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
  static const String suraRoute = "/sura";
  static const String hadethRoute = "/hadeth";
  static const String doaaRoute = "/doaa";
  static const String bookmarksRoute = "/bookmarks";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routes.suraRoute:
        return MaterialPageRoute(
            builder: (context) => SuraScreen(settings.arguments.toString()));

      case Routes.hadethRoute:
        return MaterialPageRoute(
            builder: (context) => HadethScreen(settings.arguments));

      case Routes.doaaRoute:
        return MaterialPageRoute(
            builder: (context) => DoaaScreen(settings.arguments));

      case Routes.bookmarksRoute:
        return MaterialPageRoute(builder: (context) => const BookmarksScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteTitle),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
