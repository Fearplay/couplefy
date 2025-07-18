// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appName => 'Love Counter';

  @override
  String get loveCounterHomePageTitle => 'Počítadlo Lásky';

  @override
  String get nameDayHomePageTitle => 'Svátek';

  @override
  String get holidayHomePageTitle => 'Světový svátek';

  @override
  String nameDayHomePage(Object day, Object month) {
    return 'Dnes je $day.$month. a svátek slaví';
  }

  @override
  String globalHolidaysHomePage(Object day, Object month) {
    return 'Dnes je $day.$month. a slaví se';
  }

  @override
  String get globalHolidaysHomePageInfoTextUs => '(Rozšířený zejména v USA)';

  @override
  String get globalHolidaysHomePageInfoTextWw => '(Rozšířený po celém světě)';

  @override
  String get quoteHomePageTitle => 'Citát';

  @override
  String get homeTabName => 'Domovská Stránka';

  @override
  String get loveTabName => 'Počítadlo Lásky';

  @override
  String get nameDayTabName => 'Svátky';

  @override
  String get quotesTabName => 'Citáty';

  @override
  String get settingsTabName => 'Nastavení';

  @override
  String get settingsNameTitle => 'Jména';

  @override
  String get firstNameHint => 'Zadejte své jméno';

  @override
  String get secondNameHint => 'Zadejte jméno partnera';

  @override
  String get dateWriteHint => 'mm/dd/rrrr';

  @override
  String get quoteButton => 'Nový Citát';

  @override
  String get saveButtonNames => 'Uložit';

  @override
  String get saveButtonDate => 'Uložit';

  @override
  String get namesFallback => 'Musíš zadat obě jména v nastavení!';

  @override
  String get snackBarNames => 'Obě jména musí být vyplněná!';

  @override
  String get snackBarSaveNames => 'Jména byla uložena!';

  @override
  String get snackBarSaveDate => 'Datum bylo uloženo!';

  @override
  String get settingsDateTitle => 'Začátek data';

  @override
  String get dateLabel => 'Datum';

  @override
  String get datePickerHintText => 'Vyberte datum';

  @override
  String yearsText(num countYears) {
    String _temp0 = intl.Intl.pluralLogic(
      countYears,
      locale: localeName,
      other: '$countYears let',
      few: '$countYears roky',
      one: '$countYears rok',
    );
    return '$_temp0';
  }

  @override
  String monthsText(num countMonths) {
    String _temp0 = intl.Intl.pluralLogic(
      countMonths,
      locale: localeName,
      other: '$countMonths měsíců',
      few: '$countMonths měsíce',
      one: '$countMonths měsíc',
    );
    return '$_temp0';
  }

  @override
  String weeksText(num countWeeks) {
    String _temp0 = intl.Intl.pluralLogic(
      countWeeks,
      locale: localeName,
      other: '$countWeeks týdnů',
      few: '$countWeeks týdny',
      one: '$countWeeks týden',
    );
    return '$_temp0';
  }

  @override
  String daysText(num countDays) {
    String _temp0 = intl.Intl.pluralLogic(
      countDays,
      locale: localeName,
      other: '$countDays dnů',
      few: '$countDays dny',
      one: '$countDays den',
    );
    return '$_temp0';
  }

  @override
  String get settingsOptionsTitle => 'Možnosti';

  @override
  String get darkModeText => 'Tmavý režim';

  @override
  String get internationalHolidaysText => 'Světové svátky';

  @override
  String get showOnlyDaysText => 'Jen dny';

  @override
  String get startFromZeroText => 'Začít od nuly';

  @override
  String get appLanguageText => 'Jazyk';

  @override
  String get appLanguageMenuLabel => 'Jazyk';

  @override
  String get appMenuItemEnglish => 'Angličtina';

  @override
  String get appMenuItemCzech => 'Čeština';

  @override
  String get infoButton => 'O aplikaci';

  @override
  String get supportButton => 'Buy me a coffee';

  @override
  String get homeButtonNavigation => 'Domů';

  @override
  String get loveButtonNavigation => 'Láska';

  @override
  String get nameDayButtonNavigation => 'Svátky';

  @override
  String get globalHolidayButtonNavigation => 'Svátky';

  @override
  String get quotesButtonNavigation => 'Citáty';

  @override
  String get settingsButtonNavigation => 'Nastavení';
}
