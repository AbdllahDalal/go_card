import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/theme_controller.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/t_keys.g.dart';

class DarkModPop extends StatefulWidget {
  const DarkModPop({super.key});

  @override
  State<DarkModPop> createState() => _DarkModPopState();
}

class _DarkModPopState extends State<DarkModPop> {
  final ThemeController _themeControler = Get.put(ThemeController());
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
          height: 360,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: _theme.colorScheme.background,
          ),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 30),
                    child: customText(
                        text: LocaleKeys.darkMode_.tr,
                        fontColor: _theme.colorScheme.primary,
                        fontSize: Constants.textLarge),
                  ),
                  RadioListe(
                    themeControler: _themeControler,
                    mode: "System",
                    name: LocaleKeys.system.tr,
                  ),
                  RadioListe(
                    themeControler: _themeControler,
                    mode: "Light Mode",
                    name: LocaleKeys.lightMode.tr,
                  ),
                  RadioListe(
                    themeControler: _themeControler,
                    mode: "Dark Mode",
                    name: LocaleKeys.darkMode.tr,
                  ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.grey,
                        ),
                        child: customText(
                          text: LocaleKeys.cancel.tr,
                        )),
                  )
                ]),
          )),
    );
  }
}

// ignore: must_be_immutable
class RadioListe extends StatelessWidget {
  RadioListe({
    super.key,
    required ThemeController themeControler,
    required this.mode,
    required this.name,
  }) : _themeControler = themeControler;
  final String mode;
  final String name;
  final ThemeController _themeControler;
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Obx(
      () => RadioListTile(
        activeColor: Constants.kSecondaryColor,
        title: customText(
            text: name,
            fontColor: _theme.colorScheme.primary,
            textAlign: TextAlign.start),
        value: mode,
        groupValue: _themeControler.currentOption,
        onChanged: (value) {
          _themeControler.modebuttem(value);
        },
      ),
    );
  }
}
