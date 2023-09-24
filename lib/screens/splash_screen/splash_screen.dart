import 'package:ana_muslim/screens/splash_screen/splash_view_body.dart';
import 'package:ana_muslim/service/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String scaffoldBackground = Utils(context).scaffoldBackgroundImage;

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(scaffoldBackground),
              fit: BoxFit.fill,
            ),
          ),
          child: const SplashViewBody()),
    );
  }
}
