import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:couplefy/l10n/app_localizations.dart';

/// Navigation Bar Screen (to be able to switch to different screens)
class NavigationScreen extends StatelessWidget {
  /// Creates an instance of [NavigationScreen].
  ///
  ///   Parameters:
  /// - [currentPageIndex]: For tracking which page is current.
  /// - [onTap]: Method for capturing onTap.
  const NavigationScreen({super.key, required this.currentPageIndex, required this.onTap});

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
        // To not show Labels for not selected items
        showUnselectedLabels: false,
        currentIndex: currentPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        items: [
          // Navigation item representing the Love screen
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: AppLocalizations.of(context)!.loveButtonNavigation,
            backgroundColor: Colors.purple,
          ),
          if (SharedPreferencesUtils.globalHolidays.value == true) ...{
            // Navigation item representing the Holiday screen
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: AppLocalizations.of(context)!.globalHolidayButtonNavigation,
              backgroundColor: Colors.purple,
            ),
          } else ...{
            // Navigation item representing the Name Day screen
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: AppLocalizations.of(context)!.nameDayButtonNavigation,
              backgroundColor: Colors.purple,
            ),
          },
          // Navigation item representing the Home screen
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.homeButtonNavigation,
            backgroundColor: Colors.purple,
          ),
          // Navigation item representing the Quotes screen
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: AppLocalizations.of(context)!.quotesButtonNavigation,
            backgroundColor: Colors.purple,
          ),
          // Navigation item representing the Settings screen
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settingsButtonNavigation,
            backgroundColor: Colors.purple,
          ),
        ],
        onTap: onTap,
      ),
    );
  }
}
