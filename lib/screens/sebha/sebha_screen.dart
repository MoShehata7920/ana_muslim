import 'package:ana_muslim/provider/sebha_provider.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/service/animation.dart';
import 'package:ana_muslim/service/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color suraDecoration = Utils(context).suraDecoration;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppStrings.sebhaCounter,
              style: TextStyle(fontSize: 24.0),
            ).animateOnPageLoad(
                msDelay: 300, dx: 70.0, dy: 0.0, showDelay: 300),
            const SizedBox(height: 20.0),
            Consumer<SebhaProvider>(
              builder: (context, sebhaProvider, _) {
                return Text(
                  '${sebhaProvider.count}',
                  style: const TextStyle(
                      fontSize: 48.0, fontWeight: FontWeight.bold),
                ).animateOnPageLoad(
                    msDelay: 300, dx: -70.0, dy: 0.0, showDelay: 300);
              },
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      30.0), // Adjust the radius as needed
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<SebhaProvider>(context, listen: false)
                          .incrementCount();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: suraDecoration,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                    ),
                    child: Text(
                      AppStrings.sabah,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ).animateOnPageLoad(
                    msDelay: 300, dx: -70.0, dy: 0.0, showDelay: 300),
                const SizedBox(width: 20.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      30.0), // Adjust the radius as needed
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<SebhaProvider>(context, listen: false)
                          .resetCount();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: suraDecoration,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                    ),
                    child: Text(
                      AppStrings.reset,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ).animateOnPageLoad(
                    msDelay: 300, dx: 70.0, dy: 0.0, showDelay: 300)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
