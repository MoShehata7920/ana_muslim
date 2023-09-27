// ignore_for_file: no_logic_in_create_state

import 'package:ana_muslim/models/doaa_model.dart';
import 'package:ana_muslim/widgets/custom_inner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoaaScreen extends StatefulWidget {
  final Object? doaaModel;

  const DoaaScreen(this.doaaModel, {Key? key}) : super(key: key);

  @override
  DoaaScreenState createState() => DoaaScreenState(doaaModel as DoaaModel);
}

class DoaaScreenState extends State<DoaaScreen> {
  DoaaModel doaaModel;
  DoaaScreenState(this.doaaModel);

  List<String> doaaString = [];

  @override
  Widget build(BuildContext context) {
    if (doaaString.isEmpty) {
      loadFile(doaaModel.index);
    }

    return CustomInnerScreen(
      screenTitle: doaaModel.name,
      juzNumber: "",
      isSuraScreen: false,
      isMakeah: false,
      screenBody: screenBody(),
    );
  }

  Widget screenBody() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              doaaString[index],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        },
        itemCount: doaaString.length,
      ),
    );
  }

  void loadFile(int index) async {
    String file =
        await rootBundle.loadString("assets/files/doaa/${index + 1}.txt");
    List<String> suraLines = file.split("\n");

    doaaString = [];
    for (int i = 0; i < suraLines.length; i++) {
      String line = suraLines[i];
      String modifiedLine = line.trimRight();
      doaaString.add(modifiedLine);
    }

    setState(() {});
  }
}
