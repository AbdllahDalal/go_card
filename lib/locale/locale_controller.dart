// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocaleController extends GetxController {
  // void changeLang(String codeLang) {
  //   Locale locale = Locale(codeLang);
  //   Get.updateLocale(locale);
  // }
  var _languageData = "en".obs;
  String get languageData => _languageData.value;

  var _currentOption = "en".obs;

  String get currentOption => _currentOption.value;

  void languagebuttem(nowOption) {
    Locale locale = Locale(nowOption);
    Get.updateLocale(locale);
    _languageData.value = nowOption;
    _currentOption.value = nowOption;
    saveLang(nowOption);
  }

  Future<void> saveLang(String nowOption) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", nowOption);
  }

  void languageGet(String prefsLanguage) {
    _languageData.value = prefsLanguage;
    _currentOption.value = prefsLanguage;
  }
}
