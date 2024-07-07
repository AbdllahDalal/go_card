import 'package:dream_store_app/locale/local.dart';
import 'package:dream_store_app/locale/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/theme/theme.dart';

import 'controller/prodect_controller.dart';
import 'controller/theme_controller.dart';
import 'routers/routers.dart';
// import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MyApp(
      prefs: prefs,
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key, required this.prefs});
  final SharedPreferences prefs;
  late final ThemeController _themecontroler = Get.put(ThemeController());
  final prodectController = Get.lazyPut(() => ProdectController(), fenix: true);

  late final MyLocaleController _myLocaleController =
      Get.put(MyLocaleController());
  @override
  Widget build(BuildContext context) {
    // _themecontroler = Provider.of(context);
    _themecontroler.modeGet(prefs.getString("Mode") ?? "System");
    _myLocaleController.languageGet(prefs.getString("language") ?? "en");
    return Obx(
      () => GetMaterialApp(
        locale: Locale(_myLocaleController.languageData),
        translations: MyLocale(),
        debugShowCheckedModeBanner: false,
        title: "Go Card",
        theme: _themecontroler.themeData == "Dark Mode" ? darkMode : lightMode,
        darkTheme:
            _themecontroler.themeData == "Light Mode" ? lightMode : darkMode,
        initialRoute: RoutesClass.getsplashPageRoute(),
        getPages: RoutesClass.routes,
      ),
    );
  }
}
