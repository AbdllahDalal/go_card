import 'package:dream_store_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../locale/locale_controller.dart';
import '../../../utilities/t_keys.g.dart';
import '../../widget/share_compont/custom_appbare.dart';
import 'widget/radio_lang_card.dart';

// ignore: must_be_immutable
class SetLangPage extends StatelessWidget {
  SetLangPage({super.key});
  late ThemeData _theme;
  final MyLocaleController _myLocaleController = Get.put(MyLocaleController());
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      appBar: customAppBar(
        LocaleKeys.setLanguage.tr,
        context,
        backgroundColor: _theme.colorScheme.background,
        fontColor: _theme.colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: _theme.colorScheme.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          RadioLangCard(
            mode: "en",
            name: LocaleKeys.english.tr,
            myLocaleController: _myLocaleController,
            image: Constants.usaFlagImage,
          ),
          RadioLangCard(
            mode: "ar",
            name: LocaleKeys.arabic.tr,
            myLocaleController: _myLocaleController,
            image: Constants.saudiFlagImage,
          ),
          RadioLangCard(
            mode: "zh",
            name: LocaleKeys.chinese.tr,
            myLocaleController: _myLocaleController,
            image: Constants.chinaFlagImage,
          ),
          RadioLangCard(
            mode: "fr",
            name: LocaleKeys.french.tr,
            myLocaleController: _myLocaleController,
            image: Constants.franceFlagImage,
          ),
          RadioLangCard(
            mode: "de",
            name: LocaleKeys.german.tr,
            myLocaleController: _myLocaleController,
            image: Constants.germanyFlagImage,
          ),
          RadioLangCard(
            mode: "ru",
            name: LocaleKeys.russian.tr,
            myLocaleController: _myLocaleController,
            image: Constants.russiaFlagImage,
          ),
        ]),
      ),
    );
  }
}
