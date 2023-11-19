// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class SuraScreen extends StatelessWidget {
  final String startImageIndex;

  const SuraScreen(this.startImageIndex, {Key? key}) : super(key: key);

  List<String> generateImageList() {
    int startIndex = int.parse(startImageIndex);
    List<String> imageList = [];

    for (int i = startIndex; i <= 604; i++) {
      imageList.add(i.toString());
    }

    return imageList;
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageFilenames = generateImageList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 1,
      ),
      body: Swiper(
        loop: false,
        itemCount: imageFilenames.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: MediaQuery.of(context).size.height - 30,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/quran/${imageFilenames[index]}.png',
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        autoplay: false,
      ),
    );
  }
}
