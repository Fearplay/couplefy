import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:couplefy/app.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:google_fonts/google_fonts.dart';

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
  GoogleFonts.config.allowRuntimeFetching = false;
  // Run my app
  runApp(MyApp());
}
