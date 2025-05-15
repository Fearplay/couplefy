import 'dart:ffi';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:couplefy/data/quotes.dart';
import 'package:couplefy/models/quotes_model.dart';
import 'package:couplefy/l10n/app_localizations.dart';

class LoveCounterUtils {
  static String? firstPersonName;
  static String? secondPersonName;

  // static String namesTogether(BuildContext context){
  //   if(firstPersonName != null && secondPersonName != null){
  //     return "$firstPersonName + $secondPersonName";
  //   }
  //   return AppLocalizations.of(context)!.namesFallback;
  // }
  //
  // static String namesTogether(BuildContext context) {
  //   return "$firstPersonName + $secondPersonName";
  // }
    static List<String> namesListTogether(BuildContext context) {
      if(firstPersonName == null || secondPersonName == null){
        return [];
      }
      return [firstPersonName!, "+", secondPersonName!];
  }

  static String namesTogether(BuildContext context) {
        if(firstPersonName != null || secondPersonName != null){
      return "$firstPersonName + $secondPersonName";
    }
    return AppLocalizations.of(context)!.namesFallback;
  }
}
