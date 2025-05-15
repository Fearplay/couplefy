// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Love Counter';

  @override
  String get loveCounterHomePageTitle => 'Love Counter';

  @override
  String get nameDayHomePageTitle => 'Name Day';

  @override
  String nameDayHomePage(Object day, Object month) {
    return 'Today is $day.$month. and the name day is celebrated by';
  }

  @override
  String get quoteHomePageTitle => 'Quote';

  @override
  String get homeTabName => 'Home';

  @override
  String get loveTabName => 'Love Counter';

  @override
  String get nameDayTabName => 'Name Days';

  @override
  String get quotesTabName => 'Quotes';

  @override
  String get settingsTabName => 'Settings';

  @override
  String get settingsNameTitle => 'Names';

  @override
  String get firstNameHint => 'Enter your name';

  @override
  String get secondNameHint => 'Enter second name';

  @override
  String get quoteButton => 'New Quote';

  @override
  String get saveButton => 'Save';

  @override
  String get namesFallback => 'You need to update both names in the settings!';

  @override
  String get snackBarNames => 'Both names must be filled!';

  @override
  String get settingsDateTitle => 'Start Date';

  @override
  String get dateLabel => 'Date';

  @override
  String yearsText(num countYears) {
    String _temp0 = intl.Intl.pluralLogic(
      countYears,
      locale: localeName,
      other: '$countYears years',
      one: '$countYears year',
    );
    return '$_temp0';
  }

  @override
  String monthsText(num countMonths) {
    String _temp0 = intl.Intl.pluralLogic(
      countMonths,
      locale: localeName,
      other: '$countMonths months',
      one: '$countMonths month',
    );
    return '$_temp0';
  }

  @override
  String weeksText(num countWeeks) {
    String _temp0 = intl.Intl.pluralLogic(
      countWeeks,
      locale: localeName,
      other: '$countWeeks weeks',
      one: '$countWeeks week',
    );
    return '$_temp0';
  }

  @override
  String daysText(num countDays) {
    String _temp0 = intl.Intl.pluralLogic(
      countDays,
      locale: localeName,
      other: '$countDays days',
      one: '$countDays day',
    );
    return '$_temp0';
  }

  @override
  String get darkModeText => 'Dark Mode';

  @override
  String get showOnlyDaysText => 'Days only';

  @override
  String get appLanguageText => 'Language';

  @override
  String get appLanguageMenuLabel => 'Language';

  @override
  String get appMenuItemEnglish => 'English';

  @override
  String get appMenuItemCzech => 'Czech';

  @override
  String get infoButton => 'About App';

  @override
  String get homeButtonNavigation => 'Home';

  @override
  String get loveButtonNavigation => 'Love';

  @override
  String get nameDayButtonNavigation => 'Name Days';

  @override
  String get quotesButtonNavigation => 'Quotes';

  @override
  String get settingsButtonNavigation => 'Settings';
}
