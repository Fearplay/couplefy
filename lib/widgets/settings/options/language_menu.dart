import 'package:flutter/material.dart';
import 'package:couplefy/data/menu_items.dart';
import 'package:couplefy/models/menu_item_model.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:couplefy/app.dart';
import 'package:couplefy/l10n/app_localizations.dart';

class LanguageMenu extends StatefulWidget {
  const LanguageMenu({super.key});

  @override
  State<LanguageMenu> createState() => _LanguageMenuState();
}

class _LanguageMenuState extends State<LanguageMenu> {
  MenuItemModel? selectedMenu;

  @override
  void initState() {
    super.initState();
    String? savedLanguage = SharedPreferencesUtils.selectedValue;
    if (savedLanguage != null) {
      for (var item in menuItems) {
        if (item.languageCode == savedLanguage) {
          selectedMenu = item;
          break;
        }
      }
      selectedMenu ??= menuItems.first;
    } else {
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
        DropdownMenu<MenuItemModel>(
          initialSelection: selectedMenu,
          label: Text(
            AppLocalizations.of(context)!.appLanguageMenuLabel,
            style: AppTextStyles.hintText(context),
          ),
          width: 120,
          menuStyle: MenuStyle(
    backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.secondaryContainer),

  ),

          // width: MediaQuery
          //     .of(context)
          //     .size
          //     .width * 0.30,
          onSelected: (MenuItemModel? menu) {
            setState(() {
              selectedMenu = menu;
            });
            SharedPreferencesUtils.selectedValue = menu!.languageCode;
            SharedPreferencesUtils.saveSelectedValue(menu.languageCode);
            MyApp.language = Locale(menu.languageCode);
            MyApp.of(context)?.setState(() {});
          },
          dropdownMenuEntries: [
            for (var menu in menuItems)
              DropdownMenuEntry<MenuItemModel>(
                value: menu,
                label: menu.language
              ),
          ],
        )
        // CountryFlag.fromCountryCode('US'),
        // CountryFlag.fromLanguageCode('en'),
        // DropdownMenu(dropdownMenuEntries: dropdownMenuEntries)
      ],
    );
  }
}
