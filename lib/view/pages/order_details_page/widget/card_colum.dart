import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../locale/locale_controller.dart';
import '../../../widget/share_compont/custom_text.dart';

class CardColum extends StatelessWidget {
  CardColum({
    super.key,
    required ThemeData theme,
    required this.title,
    required this.column,
  }) : _theme = theme;

  final ThemeData _theme;
  final String title;
  final List<Widget> column;
  late final MyLocaleController _myLocaleController =
      Get.put(MyLocaleController());
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          elevation: 6,
          color: _theme.colorScheme.primaryContainer,
          surfaceTintColor: _theme.colorScheme.primaryContainer,
          // shape: CircleBorder(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
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
              line(marginX: 10),
              Column(children: column),
            ],
          ),
        ),
      ),
    );
  }
}
