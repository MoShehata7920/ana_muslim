import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/service/animation.dart';
import 'package:ana_muslim/service/utils.dart';
import 'package:flutter/material.dart';

class CustomInnerScreen extends StatelessWidget {
  const CustomInnerScreen(
      {super.key,
      required this.screenTitle,
      required this.juzNumber,
      required this.isSuraScreen,
      required this.isMakeah,
      required this.screenBody});
  final String screenTitle, juzNumber;
  final bool isSuraScreen;
  final bool isMakeah;
  final Widget screenBody;

  @override
  Widget build(BuildContext context) {
    Color suraDecoration = Utils(context).suraDecoration;
    String scaffoldBackgroundImage = Utils(context).scaffoldBackgroundImage;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(scaffoldBackgroundImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(width: 0.2),
              color: suraDecoration),
          child: InteractiveViewer(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    screenTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ).animateOnPageLoad(
                      msDelay: 150, dx: 0.0, dy: -200.0, showDelay: 900),
                ),
                isSuraScreen
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(AppStrings.juzaa).animateOnPageLoad(
                                    msDelay: 150,
                                    dx: -100.0,
                                    dy: 0.0,
                                    showDelay: 900),
                                Text(
                                  juzNumber,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ).animateOnPageLoad(
                                    msDelay: 150,
                                    dx: -100.0,
                                    dy: 0.0,
                                    showDelay: 900),
                              ],
                            ),
                            isMakeah
                                ? Image.asset(
                                    ImageAssets.makkah,
                                    width:
                                        32, // Set the desired width for the icon
                                    height: 32,
                                  ).animateOnPageLoad(
                                    msDelay: 150,
                                    dx: 100.0,
                                    dy: 0.0,
                                    showDelay: 900)
                                : Image.asset(
                                    ImageAssets.madena,
                                    width:
                                        32, // Set the desired width for the icon
                                    height: 32,
                                  ).animateOnPageLoad(
                                    msDelay: 150,
                                    dx: 100.0,
                                    dy: 0.0,
                                    showDelay: 900),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const Divider(
                  endIndent: 30,
                  indent: 30,
                  thickness: 2,
                ),
                screenBody,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
