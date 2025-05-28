import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:couplefy/app.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // To not show phone buttons. Only app buttons
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // Only portrait up is allowed
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // Init of things in Shared Preferences
  await SharedPreferencesUtils.init();
  // Run my app
  runApp(MyApp());
}
