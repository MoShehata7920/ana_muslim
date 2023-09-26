import 'package:flutter/material.dart';

class SebhaProvider with ChangeNotifier {
  int _count = 100;
  String _zekrContent = "سُبْحَانَ الله";

  int _counter = 33;
  int get counter => _counter;

  List<String> azkar = [
    "سُبْحَانَ الله",
    "الحمد لله",
    "الله اكبر",
    "لا إله إلا الله وحده لا شريكَ له، له الملك، وله الحمد، وهو على كل شيءٍ قدير، سبحان الله، والحمد لله، ولا إله إلا الله، والله أكبر، ولا حولَ ولا قوةَ إلا بالله العلي العظيم"
  ];

  String get zekrContent => _zekrContent;

  int update() {
    if (_count > 67) {
      _count--;
      _zekrContent = azkar[0];
      updateCounter();
    } else if (_count > 34) {
      _count--;
      _zekrContent = azkar[1];
      updateCounter();
    } else if (_count > 1) {
      _count--;
      _zekrContent = azkar[2];
      updateCounter();
    } else if (_count == 1) {
      _count--;
      _zekrContent = azkar[3];
      _counter = 1;
    } else {
      restart();
    }

    notifyListeners();

    return _counter;
  }

  void updateCounter() {
    if (_counter == 1) {
      _counter = 33;
    } else {
      _counter--;

      notifyListeners();
    }
  }

  void restart() {
    _count = 100;
    _counter = 34;
    update();
    notifyListeners();
  }
}
