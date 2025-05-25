import 'package:flutter/cupertino.dart';
import 'package:couplefy/l10n/app_localizations.dart';

class LoveCounterUtils {
  /// Name of the first person
  static String? firstPersonName;

  /// Name of the second person
  static String? secondPersonName;

  /// Method if the [firstPersonName.length] is greater than 8 and [secondPersonName.length] is greater than 8.
  ///
  /// Returns:
  /// - A [List]: An empty list if [firstPersonName] is null or [secondPersonName] is null.
  /// - A [List]: With [String] `firstPersonName`, `+`, `secondPersonName` if [firstPersonName] is not null or [secondPersonName] is not null.
  static List<String> namesListTogether() {
    if (firstPersonName == null || secondPersonName == null) {
      return [];
    }
    return [firstPersonName!, "+", secondPersonName!];
  }

  /// Method if the [firstPersonName.length] is lower than 9 and [secondPersonName.length] is lower than 9.
  ///
  ///   Parameters:
  /// - [context]: The build context for the [AppLocalizations].
  ///
  /// Returns:
  /// - A [String]: Text `firstPersonName + secondPersonName` if [firstPersonName] is not null or [secondPersonName] is not null.
  /// - A [String]: Fallback text if [firstPersonName] is null or [secondPersonName] is null.
  static String namesTogether(BuildContext context) {
    if (firstPersonName != null || secondPersonName != null) {
      return "$firstPersonName + $secondPersonName";
    }
    return AppLocalizations.of(context)!.namesFallback;
  }
}
