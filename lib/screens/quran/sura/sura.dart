// ignore_for_file: no_logic_in_create_state

import 'package:ana_muslim/models/sura_model.dart';
import 'package:ana_muslim/service/utils.dart';
import 'package:ana_muslim/widgets/custom_inner_screen.dart';
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
    return CustomInnerScreen(
      screenTitle: suraModel.name,
      juzNumber:
          quran.getJuzNumber(suraModel.index + 1, verseIndex + 1).toString(),
      isSuraScreen: true,
      isMakeah: (quran.getPlaceOfRevelation(suraModel.index + 1).toString() ==
          "Makkah"),
      screenBody: screenBody(context),
    );
  }

  Widget screenBody(BuildContext context) {
    Color textColor = Utils(context).textColor;
    return Expanded(
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
              textDirection: TextDirection.rtl,
            ),
          );
        },
      ),
    );
  }
}
