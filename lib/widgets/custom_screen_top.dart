import 'package:ana_muslim/service/animation.dart';
import 'package:flutter/material.dart';

class CustomScreenTop extends StatelessWidget {
  const CustomScreenTop(
      {super.key,
      required this.topIcon,
      required this.screenTitle,
      required this.screenBody});
  final String topIcon, screenTitle;
  final Widget screenBody;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(topIcon).animateOnPageLoad(
              msDelay: 150, dx: 0.0, dy: -200.0, showDelay: 900),
        ),
        const Divider(color: Color(0xFFB7935F), thickness: 2),
        Text(
          screenTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ).animateOnPageLoad(msDelay: 150, dx: 0.0, dy: -200.0, showDelay: 900),
        const Divider(color: Color(0xFFB7935F), thickness: 2),
        screenBody
      ],
    );
  }
}
