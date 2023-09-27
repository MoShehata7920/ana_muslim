import 'package:ana_muslim/provider/theme_provider.dart';
import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/resources/icons_manager.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/service/utils.dart';
import 'package:flutter/material.dart';
import 'package:ana_muslim/screens/ahadeth/ahadeth_screen.dart';
import 'package:ana_muslim/screens/quran/quran_screen.dart';
import 'package:ana_muslim/screens/adya/adya_screen.dart';
import 'package:ana_muslim/screens/sebha/sebha_screen.dart';
import 'package:provider/provider.dart';

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
    const SebhaScreen(),
    AdyaScreen(),
    QuranScreen(),
    const AhadethScreen(),
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
              if (index != _screens.length) {
                setState(() {
                  _currentIndex = index;
                });
              } else {
                // Toggle the app's theme if Settings icon is tapped
                _toggleTheme(context);
              }
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
    final themeState = context.read<ThemeProvider>();

    return [
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
          AssetImage(ImageAssets.doaa),
          size: 30,
        ),
        label: AppStrings.doaa,
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
        icon: Icon(
            themeState.getDarkTheme ? AppIcons.lightMode : AppIcons.darkMode),
        label: AppStrings.settings,
        backgroundColor: bottomNavBarColor,
      )
    ];
  }

  void _toggleTheme(BuildContext context) {
    final themeState = context.read<ThemeProvider>();

    themeState.setDarkTheme = !themeState.getDarkTheme;
  }
}
