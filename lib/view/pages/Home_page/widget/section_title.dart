import 'package:dream_store_app/locale/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/share_compont/custom_text.dart';

// ignore: must_be_immutable
class SectionTitle extends StatelessWidget {
  SectionTitle({super.key, required this.title});
  final String title;
  late ThemeData _theme;
  late final MyLocaleController _myLocaleController =
      Get.put(MyLocaleController());
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: _myLocaleController.languageData == "ar"
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: customText(
                text: title,
                fontColor: _theme.colorScheme.primary,
                // fontSize: Constants.textLarge,
                fontWeight: FontWeight.w500),
          ),
          line(),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
