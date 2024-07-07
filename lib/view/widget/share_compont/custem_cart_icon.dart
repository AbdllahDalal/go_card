import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/prodect_controller.dart';
import '../../../utilities/constants.dart';

class CustemCartIcon extends StatelessWidget {
  final Color iconColor;
  final bool withShadow;
  const CustemCartIcon({
    super.key,
    required this.iconColor,
    this.withShadow = false,
    required this.prodectController,
  });
  final ProdectController prodectController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              withShadow
                  ? const BoxShadow(
                      color: Colors.black12, blurRadius: 5, spreadRadius: 2)
                  : const BoxShadow(
                      color: Colors.transparent, blurRadius: 0, spreadRadius: 0)
            ]),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: iconColor,
            ),
          ),
        ),
        GetBuilder<ProdectController>(
          init: ProdectController(),
          builder: (controller) => Visibility(
            visible: controller.cardprodects.isNotEmpty,
            child: Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Constants.kGoldColor),
                child: Text(
                  controller.cardprodects.length.toString(),
                  style: const TextStyle(
                      color: Constants.kTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
