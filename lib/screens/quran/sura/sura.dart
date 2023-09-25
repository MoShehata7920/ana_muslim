// ignore_for_file: no_logic_in_create_state

import 'package:ana_muslim/models/sura_model.dart';
import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/service/animation.dart';
import 'package:ana_muslim/service/utils.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class SuraScreen extends StatefulWidget {
  final Object? suraModel;

  const SuraScreen(this.suraModel, {Key? key}) : super(key: key);

  @override
  SuraScreenState createState() => SuraScreenState(suraModel as SuraModel);
}

class SuraScreenState extends State<SuraScreen> {
  SuraModel suraModel;
  SuraScreenState(this.suraModel);

  int verseIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Utils(context).textColor;
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
                    suraModel.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ).animateOnPageLoad(
                      msDelay: 150, dx: 0.0, dy: -200.0, showDelay: 900),
                ),
                Padding(
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
                            quran
                                .getJuzNumber(
                                    suraModel.index + 1, verseIndex + 1)
                                .toString(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ).animateOnPageLoad(
                              msDelay: 150,
                              dx: -100.0,
                              dy: 0.0,
                              showDelay: 900),
                        ],
                      ),
                      (quran
                                  .getPlaceOfRevelation(suraModel.index + 1)
                                  .toString() ==
                              "Makkah")
                          ? Image.asset(
                              ImageAssets.makkah,
                              width: 32, // Set the desired width for the icon
                              height: 32,
                            ).animateOnPageLoad(
                              msDelay: 150, dx: 100.0, dy: 0.0, showDelay: 900)
                          : Image.asset(
                              ImageAssets.madena,
                              width: 32, // Set the desired width for the icon
                              height: 32,
                            ).animateOnPageLoad(
                              msDelay: 150, dx: 100.0, dy: 0.0, showDelay: 900),
                    ],
                  ),
                ),
                const Divider(
                  endIndent: 30,
                  indent: 30,
                  thickness: 2,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    itemCount: quran.getVerseCount(suraModel.index + 1),
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            verseIndex = index;
                          });
                        },
                        title: Text(
                          quran.getVerse(suraModel.index + 1, index + 1,
                              verseEndSymbol: true),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
