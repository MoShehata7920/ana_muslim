import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/resources/icons_manager.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/service/utils.dart';
import 'package:flutter/material.dart';
import 'package:ana_muslim/screens/ahadeth/ahadeth_screen.dart';
import 'package:ana_muslim/screens/quran/quran_screen.dart';
import 'package:ana_muslim/screens/radio/radio_screen.dart';
import 'package:ana_muslim/screens/sebha/sebha_screen.dart';
import 'package:ana_muslim/screens/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = [
    const RadioScreen(),
    const SebhaScreen(),
    QuranScreen(),
    AhadethScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    String scaffoldBackground = Utils(context).scaffoldBackgroundImage;

    return Stack(
      children: [
        Image.asset(
          scaffoldBackground,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: _navBarItems(context),
          ),
          body: _screens[_currentIndex],
        ),
      ],
    );
  }

  List<BottomNavigationBarItem> _navBarItems(BuildContext context) {
    Color bottomNavBarColor = Utils(context).bottomNavBarColor;

    return [
      BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.radio),
          size: 30,
        ),
        label: AppStrings.radio,
        backgroundColor: bottomNavBarColor,
      ),
      BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.sebha),
          size: 30,
        ),
        label: AppStrings.tasbeh,
        backgroundColor: bottomNavBarColor,
      ),
      BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.mushaf),
          size: 30,
        ),
        label: AppStrings.quran,
        backgroundColor: bottomNavBarColor,
      ),
      BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.ahadeth),
          size: 30,
        ),
        label: AppStrings.ahadeth,
        backgroundColor: bottomNavBarColor,
      ),
      BottomNavigationBarItem(
        icon: const Icon(AppIcons.settings),
        label: AppStrings.settings,
        backgroundColor: bottomNavBarColor,
      )
    ];
  }
}
