import 'package:flutter/material.dart';
import 'package:couplefy/l10n/app_localizations.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen(
      {super.key, required this.currentPageIndex, required this.onTap});

  final int currentPageIndex;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: currentPageIndex,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Color(0xFF8E24AA),
        // backgroundColor: Color(0xFF303F9F),
        selectedFontSize: 12,

        // unselectedItemColor: Colors.red,

        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: AppLocalizations.of(context)!.loveButtonNavigation,
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: AppLocalizations.of(context)!.nameDayButtonNavigation,
              backgroundColor: Colors.purple,),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.homeButtonNavigation,
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_quote),
              label: AppLocalizations.of(context)!.quotesButtonNavigation,
              backgroundColor: Colors.purple,),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settingsButtonNavigation,
              backgroundColor: Colors.purple,),
        ],
        onTap: onTap,
      ),
    );
  }
}
