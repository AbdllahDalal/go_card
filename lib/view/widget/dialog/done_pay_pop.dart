import 'package:dream_store_app/controller/prodect_controller.dart';
import 'package:dream_store_app/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/t_keys.g.dart';
import '../share_compont/custom_text.dart';

// ignore: must_be_immutable
class DonePayPop extends StatelessWidget {
  DonePayPop({super.key});
  final ProdectController prodectController = Get.find();
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return AlertDialog(
      surfaceTintColor: theme.colorScheme.background,
      backgroundColor: theme.colorScheme.background,
      title: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromRGBO(109, 202, 91, 1),
            border: Border.all(width: 7, color: const Color(0xFFBCEBBD))),
        child: const Icon(
          Icons.done,
          color: Colors.white,
          size: 130,
        ),
      ),
      content: SizedBox(
        height: 70,
        child: Column(
          children: [
            customText(
                text: LocaleKeys.done.tr,
                fontColor: theme.colorScheme.primary,
                fontSize: Constants.textVeryLarge),
            customText(
                text: LocaleKeys.yourpaymentReceiveSeller.tr,
                fontColor: theme.colorScheme.primary),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            prodectController.clearCardProdect();
            Get.offAllNamed(RoutesClass.getTabsPageRoute());
            // Add your action for 'Yes' button here
          },
          child: Text(LocaleKeys.okey.tr),
        ),
      ],
    );
  }
}
