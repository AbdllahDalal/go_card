import 'package:flutter/material.dart';

import '../../../../utilities/app_data.dart';
import '../../../../utilities/constants.dart';
import '../../../widget/share_compont/custom_text.dart';
import '../../../widget/share_compont/prodect_view.dart';

class MessageingColum extends StatelessWidget {
  const MessageingColum({
    super.key,
    required ThemeData theme,
  }) : _theme = theme;

  final ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: messages
          .map((e) => Container(
                alignment:
                    !e.isAi ? Alignment.centerRight : Alignment.centerLeft,
                margin: const EdgeInsets.all(10),
                padding: e.isAi
                    ? const EdgeInsets.only(right: 50)
                    : const EdgeInsets.only(left: 50),
                child: Container(
                  // width: double.minPositive,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: e.isAi
                          ? _theme.colorScheme.primaryContainer
                          : Constants.kPrimaryColor),
                  child: Column(
                    children: [
                      customText(
                          text: e.text,
                          fontColor: e.isAi
                              ? _theme.colorScheme.primary
                              : Constants.kTextColor),
                      Visibility(
                        visible: e.prodects.isNotEmpty,
                        child: const SizedBox(
                          height: 20,
                        ),
                      ),
                      Visibility(
                        visible: e.prodects.isNotEmpty,
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 300,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: e.prodects.length,
                              itemBuilder: (context, index) => SizedBox(
                                    height: 300,
                                    width: 220,
                                    child: ProdectView(
                                      prodect: e.prodects[index],
                                      onClick: (p0) {},
                                    ),
                                  )),
                        ),
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
