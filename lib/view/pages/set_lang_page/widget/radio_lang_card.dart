// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../locale/locale_controller.dart';
import '../../../../utilities/constants.dart';
import '../../../widget/share_compont/custom_text.dart';

// ignore: must_be_immutable
class RadioLangCard extends StatelessWidget {
  RadioLangCard({
    super.key,
    required this.mode,
    required this.name,
    required this.myLocaleController,
    required this.image,
  });
  final String mode;
  final String name;
  final String image;
  final MyLocaleController myLocaleController;
  late ThemeData _theme;
  late Size size;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    size = MediaQuery.of(context).size;
    return Obx(
      () => InkWell(
        onTap: () {
          myLocaleController.languagebuttem(mode);
        },
        child: SizedBox(
          height: 110,
          child: Card(
            elevation: 6,
            color: _theme.colorScheme.primaryContainer,
            surfaceTintColor: _theme.colorScheme.primaryContainer,
            margin: const EdgeInsets.all(10),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 110,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        image,
                        width: 70,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      customText(
                          text: name,
                          fontColor: _theme.colorScheme.primary,
                          textAlign: TextAlign.start),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 90,
                right: myLocaleController.currentOption == "ar"
                    ? 30
                    : size.width - 30,
                child: SizedBox(
                  height: 12,
                  width: 12,
                  child: RadioListTile(
                    activeColor: Constants.kSecondaryColor,
                    value: mode,
                    groupValue: myLocaleController.currentOption,
                    onChanged: (value) {
                      myLocaleController.languagebuttem(value);
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
