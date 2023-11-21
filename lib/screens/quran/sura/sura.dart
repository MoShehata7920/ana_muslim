import 'package:flutter/material.dart';

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
      body: PageView.builder(
        itemCount: imageFilenames.length,
        reverse: true, 
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: InteractiveViewer(
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
            ),
          );
        },
      ),
    );
  }
}
