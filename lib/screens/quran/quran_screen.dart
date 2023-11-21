import 'package:flutter/material.dart';

import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/resources/icons_manager.dart';
import 'package:ana_muslim/resources/routes_manager.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/screens/quran/quran_assets.dart';
import 'package:ana_muslim/service/animation.dart';
import 'package:ana_muslim/widgets/custom_screen_top.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreenTop(
      topIcon: ImageAssets.quranIcon,
      screenTitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Text(
            AppStrings.quranElKareem,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          IconButton(
            icon: const Icon(
              AppIcons.bookmarked,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.bookmarksRoute);
            },
          )
        ],
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
          String selectedSura = QuranAssets.surahImagesMap.keys.toList()[index];
          String startImageIndex = QuranAssets.surahImagesMap[selectedSura]!;

          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.suraRoute,
                arguments: startImageIndex,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        QuranAssets.juzaa[index],
                        style: const TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ).animateOnPageLoad(
                        msDelay: 150, dx: -100.0, dy: 0.0, showDelay: 900),
                    Text(
                      QuranAssets.surahImagesMap.keys.toList()[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                    Image.asset(
                      QuranAssets.isMakya[index]
                          ? ImageAssets.makkah
                          : ImageAssets.madena,
                      width: 32,
                      height: 32,
                    ).animateOnPageLoad(
                        msDelay: 150, dx: 100.0, dy: 0.0, showDelay: 900)
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: QuranAssets.surahImagesMap.length,
      ),
    );
  }
}
