import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('cs'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Love Counter'**
  String get appName;

  /// No description provided for @loveCounterHomePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Love Counter'**
  String get loveCounterHomePageTitle;

  /// No description provided for @nameDayHomePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Name Day'**
  String get nameDayHomePageTitle;

  /// No description provided for @nameDayHomePage.
  ///
  /// In en, this message translates to:
  /// **'Today is {month}/{day}, and the name day is celebrated by'**
  String nameDayHomePage(Object day, Object month);

  /// No description provided for @globalHolidaysHomePage.
  ///
  /// In en, this message translates to:
  /// **'Today is {month}/{day}, and it\'s'**
  String globalHolidaysHomePage(Object day, Object month);

  /// No description provided for @quoteHomePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Quote'**
  String get quoteHomePageTitle;

  /// No description provided for @homeTabName.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTabName;

  /// No description provided for @loveTabName.
  ///
  /// In en, this message translates to:
  /// **'Love Counter'**
  String get loveTabName;

  /// No description provided for @nameDayTabName.
  ///
  /// In en, this message translates to:
  /// **'Name Days'**
  String get nameDayTabName;

  /// No description provided for @quotesTabName.
  ///
  /// In en, this message translates to:
  /// **'Quotes'**
  String get quotesTabName;

  /// No description provided for @settingsTabName.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTabName;

  /// No description provided for @settingsNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Names'**
  String get settingsNameTitle;

  /// No description provided for @firstNameHint.
  ///
  /// In en, this message translates to:
  /// **'Type your name'**
  String get firstNameHint;

  /// No description provided for @secondNameHint.
  ///
  /// In en, this message translates to:
  /// **'Type partner\'s name'**
  String get secondNameHint;

  /// No description provided for @dateWriteHint.
  ///
  /// In en, this message translates to:
  /// **'mm/dd/yyyy'**
  String get dateWriteHint;

  /// No description provided for @quoteButton.
  ///
  /// In en, this message translates to:
  /// **'New Quote'**
  String get quoteButton;

  /// No description provided for @saveButtonNames.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButtonNames;

  /// No description provided for @saveButtonDate.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButtonDate;

  /// User didn't choose both names
  ///
  /// In en, this message translates to:
  /// **'You need to update both names in the settings!'**
  String get namesFallback;

  /// No description provided for @snackBarNames.
  ///
  /// In en, this message translates to:
  /// **'Both names must be filled!'**
  String get snackBarNames;

  /// No description provided for @snackBarSaveNames.
  ///
  /// In en, this message translates to:
  /// **'Names were saved!'**
  String get snackBarSaveNames;

  /// No description provided for @snackBarSaveDate.
  ///
  /// In en, this message translates to:
  /// **'Date was saved!'**
  String get snackBarSaveDate;

  /// No description provided for @settingsDateTitle.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get settingsDateTitle;

  /// No description provided for @dateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateLabel;

  /// No description provided for @datePickerHintText.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get datePickerHintText;

  /// Years counter
  ///
  /// In en, this message translates to:
  /// **'{countYears, plural, one{{countYears} year} other{{countYears} years}}'**
  String yearsText(num countYears);

  /// Months counter
  ///
  /// In en, this message translates to:
  /// **'{countMonths, plural, one{{countMonths} month} other{{countMonths} months}}'**
  String monthsText(num countMonths);

  /// Weeks counter
  ///
  /// In en, this message translates to:
  /// **'{countWeeks, plural, one{{countWeeks} week} other{{countWeeks} weeks}}'**
  String weeksText(num countWeeks);

  /// Days counter
  ///
  /// In en, this message translates to:
  /// **'{countDays, plural, one{{countDays} day} other{{countDays} days}}'**
  String daysText(num countDays);

  /// No description provided for @settingsOptionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Options'**
  String get settingsOptionsTitle;

  /// No description provided for @darkModeText.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkModeText;

  /// No description provided for @internationalHolidaysText.
  ///
  /// In en, this message translates to:
  /// **'Global Holidays'**
  String get internationalHolidaysText;

  /// No description provided for @showOnlyDaysText.
  ///
  /// In en, this message translates to:
  /// **'Days only'**
  String get showOnlyDaysText;

  /// No description provided for @startFromZeroText.
  ///
  /// In en, this message translates to:
  /// **'Start from zero'**
  String get startFromZeroText;

  /// No description provided for @appLanguageText.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get appLanguageText;

  /// No description provided for @appLanguageMenuLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get appLanguageMenuLabel;

  /// No description provided for @appMenuItemEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get appMenuItemEnglish;

  /// No description provided for @appMenuItemCzech.
  ///
  /// In en, this message translates to:
  /// **'Czech'**
  String get appMenuItemCzech;

  /// No description provided for @infoButton.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get infoButton;

  /// No description provided for @supportButton.
  ///
  /// In en, this message translates to:
  /// **'Buy me a coffee'**
  String get supportButton;

  /// No description provided for @homeButtonNavigation.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeButtonNavigation;

  /// No description provided for @loveButtonNavigation.
  ///
  /// In en, this message translates to:
  /// **'Love'**
  String get loveButtonNavigation;

  /// No description provided for @nameDayButtonNavigation.
  ///
  /// In en, this message translates to:
  /// **'Name Days'**
  String get nameDayButtonNavigation;

  /// No description provided for @quotesButtonNavigation.
  ///
  /// In en, this message translates to:
  /// **'Quotes'**
  String get quotesButtonNavigation;

  /// No description provided for @settingsButtonNavigation.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsButtonNavigation;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['cs', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return AppLocalizationsCs();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
