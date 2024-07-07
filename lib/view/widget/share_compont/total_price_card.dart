import 'package:dream_store_app/controller/prodect_controller.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import 'Increase_Decrease_Icon.dart';

// ignore: must_be_immutable
class TotalPriceCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final double price;
  final bool increaseQuantity;
  final VoidCallback onPressed;
  TotalPriceCard(
      {super.key,
      required this.iconData,
      required this.title,
      required this.price,
      required this.increaseQuantity,
      required this.onPressed});
  final ProdectController _prodectController = Get.find();
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          color: _theme.colorScheme.primaryContainer),
      child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: customText(
                      text: "\$",
                      fontColor: _theme.colorScheme.primary,
                      fontSize: 10),
                ),
                increaseQuantity
                    ? Obx(
                        () => customText(
                            text: (price * _prodectController.prodectQuantity)
                                .toStringAsFixed(2),
                            fontFamily: true,
                            fontColor: _theme.colorScheme.primary,
                            fontSize: 25),
                      )
                    : customText(
                        text: price.toStringAsFixed(2),
                        fontFamily: true,
                        fontColor: _theme.colorScheme.primary,
                        fontSize: 25),
              ],
            ),
            increaseQuantity
                ? Expanded(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IncreaseDecreaseIcon(
                          onPressed: () {
                            _prodectController.decreaseQuantity();
                          },
                          iconData: CupertinoIcons.minus),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Obx(
                          () => customText(
                              text: "${_prodectController.prodectQuantity}",
                              fontColor: _theme.colorScheme.primary),
                        ),
                      ),
                      IncreaseDecreaseIcon(
                        iconData: CupertinoIcons.add,
                        onPressed: () {
                          _prodectController.increaseQuantity();
                        },
                      ),
                    ],
                  ))
                : const Expanded(
                    child: SizedBox(),
                  ),
            TextButton(
              onPressed: onPressed,
              // ignore: sort_child_properties_last
              child: Row(
                children: [
                  Icon(iconData, size: 20, color: Colors.white),
                  const SizedBox(
                    width: 8,
                  ),
                  customText(text: title, fontSize: Constants.textVerySmall),
                ],
              ),
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Constants.kPrimaryColor)),
            )
          ]),
    );
  }
}
