import 'package:flutter/material.dart';
import 'package:couplefy/screens/home_screen.dart';
import 'package:couplefy/screens/love_screen.dart';
import 'package:couplefy/screens/name_day_screen.dart';
import 'package:couplefy/screens/navigation_screen.dart';
import 'package:couplefy/screens/quote_screen.dart';
import 'package:couplefy/screens/settings_screen.dart';

class MainLayout extends StatefulWidget {
  /// Creates an instance of [MainLayout].
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPageIndex = 0;

  // List with all my screens in the order
  final List<Widget> screens = const [
    LoveScreen(key: ValueKey(1)),
    NameDayScreen(key: ValueKey(2)),
    HomeScreen(key: ValueKey(3)),
    QuoteScreen(key: ValueKey(4)),
    SettingsScreen(key: ValueKey(5)),
  ];

  void onTap(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          // Duration of the animation
          duration: const Duration(milliseconds: 100),
          child: screens[currentPageIndex],
        ),
      ),
      bottomNavigationBar: NavigationScreen(
        currentPageIndex: currentPageIndex,
        onTap: onTap,
      ),
    );
  }
}
