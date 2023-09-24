import 'package:ana_muslim/provider/theme_provider.dart';
import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/resources/icons_manager.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:ana_muslim/screens/ahadeth/ahadeth_screen.dart';
import 'package:ana_muslim/screens/quran/quran_screen.dart';
import 'package:ana_muslim/screens/radio/radio_screen.dart';
import 'package:ana_muslim/screens/sebha/sebha_screen.dart';
import 'package:ana_muslim/screens/settings/settings_screen.dart';
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
    const RadioScreen(),
    const SebhaScreen(),
    QuranScreen(),
    const AhadethScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeProvider>(context).getDarkTheme;

    return Stack(
      children: [
        Image.asset(
          isDarkTheme ? ImageAssets.darkBackground : ImageAssets.mainBackground,
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
    bool isDarkTheme = Provider.of<ThemeProvider>(context).getDarkTheme;

    return [
      BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.radio),
          size: 30,
        ),
        label: AppStrings.radio,
        backgroundColor: isDarkTheme ? const Color(0xFF031A2E) : Colors.white38,
      ),
      BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.sebha),
          size: 30,
        ),
        label: AppStrings.tasbeh,
        backgroundColor: isDarkTheme ? const Color(0xFF031A2E) : Colors.white38,
      ),
      BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.mushaf),
          size: 30,
        ),
        label: AppStrings.quran,
        backgroundColor: isDarkTheme ? const Color(0xFF031A2E) : Colors.white38,
      ),
      BottomNavigationBarItem(
        icon: const ImageIcon(
          AssetImage(ImageAssets.ahadeth),
          size: 30,
        ),
        label: AppStrings.ahadeth,
        backgroundColor: isDarkTheme ? const Color(0xFF031A2E) : Colors.white38,
      ),
      BottomNavigationBarItem(
        icon: const Icon(AppIcons.settings),
        label: AppStrings.settings,
        backgroundColor: isDarkTheme ? const Color(0xFF031A2E) : Colors.white38,
      )
    ];
  }
}
