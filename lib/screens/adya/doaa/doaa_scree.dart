// ignore_for_file: no_logic_in_create_state

import 'package:ana_muslim/models/doaa_model.dart';
import 'package:flutter/material.dart';

class DoaaScreen extends StatefulWidget {
  final Object? doaaModel;

  const DoaaScreen(this.doaaModel, {Key? key}) : super(key: key);

  @override
  DoaaScreenState createState() => DoaaScreenState(doaaModel as DoaaModel);
}

class DoaaScreenState extends State<DoaaScreen> {
  DoaaModel doaaModel;
  DoaaScreenState(this.doaaModel);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
