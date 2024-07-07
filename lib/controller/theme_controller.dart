// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var _themeData = "System".obs;
  String get themeData => _themeData.value;

  var _currentOption = "System".obs;

  String get currentOption => _currentOption.value;

  void modebuttem(nowOption) {
    _themeData.value = nowOption;
    _currentOption.value = nowOption;
    modeSave(nowOption);
  }

  Future<void> modeSave(String nowOption) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Mode", nowOption);
  }

  void modeGet(prefsMode) {
    _themeData.value = prefsMode;
    _currentOption.value = prefsMode;
  }
}
