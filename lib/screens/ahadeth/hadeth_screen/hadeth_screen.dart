// ignore_for_file: no_logic_in_create_state

import 'package:ana_muslim/models/hadeth_model.dart';
import 'package:ana_muslim/widgets/custom_inner_screen.dart';
import 'package:flutter/material.dart';

class HadethScreen extends StatefulWidget {
  final Object? hadethModel;

  const HadethScreen(this.hadethModel, {Key? key}) : super(key: key);

  @override
  HadethScreenState createState() =>
      HadethScreenState(hadethModel as HadethModel);
}

class HadethScreenState extends State<HadethScreen> {
  HadethModel hadethModel;
  HadethScreenState(this.hadethModel);

  @override
  Widget build(BuildContext context) {
    return CustomInnerScreen(
      screenTitle: hadethModel.name,
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
              hadethModel.hadethContent[index],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        },
        itemCount: hadethModel.hadethContent.length,
      ),
    );
  }
}
