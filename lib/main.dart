import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:couplefy/app.dart';
import 'package:couplefy/utils/date_picker_utils.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);


  await SharedPreferencesUtils.init();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Future.delayed(Duration(seconds: 3));
  runApp(MyApp());
}



