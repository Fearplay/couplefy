import 'package:flutter/material.dart';
import 'package:couplefy/data/menu_items.dart';
import 'package:couplefy/models/menu_item_model.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:couplefy/app.dart';
import 'package:couplefy/l10n/app_localizations.dart';

/// Widget which displays language menu row. And user can choose his preferred language.
class LanguageMenu extends StatefulWidget {
  /// Creates an instance of [LanguageMenu].
  const LanguageMenu({super.key});

  @override
  State<LanguageMenu> createState() => _LanguageMenuState();
}

class _LanguageMenuState extends State<LanguageMenu> {
  MenuItemModel? selectedMenu;

  @override
  void initState() {
    super.initState();
    // Load previously saved language code from SharedPreferences
    String? savedLanguage = SharedPreferencesUtils.selectedValue;
    if (savedLanguage != null) {
      // Search the menuItems list for the language that matches the saved code
      for (var item in menuItems) {
        if (item.languageCode == savedLanguage) {
          selectedMenu = item;
          break;
        }
      }
      // Fallback: if no matching item was found, use the first menu item
      selectedMenu ??= menuItems.first;
    } else {
      // If no language is saved, use the first menu item as default
      selectedMenu = menuItems.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.appLanguageText,
          style: AppTextStyles.optionsText(context),
        ),
        // Dropdown Menu to for showing available languages from data/menu_items.dart
        DropdownMenu<MenuItemModel>(
          initialSelection: selectedMenu,
          label: Text(
            AppLocalizations.of(context)!.appLanguageMenuLabel,
            style: AppTextStyles.hintText(context),
          ),
          width: 120,
          menuStyle: MenuStyle(
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.secondaryContainer,
            ),
          ),
          onSelected: (MenuItemModel? menu) {
            setState(() {
              selectedMenu = menu;
            });
            SharedPreferencesUtils.selectedValue = menu!.languageCode;
            SharedPreferencesUtils.saveSelectedValue(
              menu.languageCode,
            );
            MyApp.language = Locale(
              menu.languageCode,
            );
            MyApp.of(context)?.setState(() {});
          },
          dropdownMenuEntries: [
            for (var menu in menuItems)
              DropdownMenuEntry<MenuItemModel>(
                value: menu,
                label: menu.language,
              ),
          ],
        )
      ],
    );
  }
}
