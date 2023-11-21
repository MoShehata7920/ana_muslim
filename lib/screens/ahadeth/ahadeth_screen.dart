import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ana_muslim/models/hadeth_model.dart';
import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/resources/routes_manager.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/widgets/custom_screen_top.dart';

class AhadethScreen extends StatefulWidget {
  const AhadethScreen({super.key});

  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<HadethModel> ahadethData = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethData.isEmpty) {
      loadHadeth();
    }
    return CustomScreenTop(
      topIcon: ImageAssets.hadethIcon,
      screenTitle: Text(
        AppStrings.elAhadethElSharif,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      screenBody: screenBody(),
    );
  }

  Widget screenBody() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: Color(0xFFB7935F),
            thickness: 1,
            endIndent: 40,
            indent: 40,
          );
        },
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.hadethRoute,
                  arguments: ahadethData[index]);
            },
            child: Center(
                child: Text(ahadethData[index].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20))),
          );
        },
        itemCount: ahadethData.length,
      ),
    );
  }

  void loadHadeth() async {
    String file = await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> ahadeth = file.split('#');

    for (int i = 0; i < ahadeth.length; i++) {
      List<String> hadethLines = ahadeth[i].trim().split("\n");
      String hadethTitle = hadethLines[0];

      hadethLines.removeAt(0);
      List<String> hadethContent = hadethLines;
      ahadethData.add(HadethModel(hadethTitle, hadethContent));
    }
    setState(() {});
  }
}
