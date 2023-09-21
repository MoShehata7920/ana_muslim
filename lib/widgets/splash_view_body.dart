import 'dart:async';
import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/resources/colors_manager.dart';
import 'package:ana_muslim/resources/routes_manager.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/service/animation.dart';
import 'package:ana_muslim/service/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            SizedBox(
              height: size.height * 0.4,
              child: Lottie.asset(JsonAssets.splash).animateOnPageLoad(
                  msDelay: 150, dx: 0.0, dy: -200.0, showDelay: 900),
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.35,
                ),
                Text(
                  AppStrings.developedBy,
                  style: TextStyle(color: ColorsManager.primaryColor),
                ).animateOnPageLoad(
                    msDelay: 300, dx: 0.0, dy: 70.0, showDelay: 300),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppStrings.mohamedShehata,
                  style: TextStyle(
                    color: ColorsManager.primaryText,
                  ),
                ).animateOnPageLoad(
                    msDelay: 300, dx: 0.0, dy: 70.0, showDelay: 300),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void navigateToHome() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, Routes.homeRoute));
  }
}
