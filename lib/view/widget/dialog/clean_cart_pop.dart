import 'package:dream_store_app/controller/prodect_controller.dart';
import 'package:dream_store_app/utilities/constants.dart';
import 'package:dream_store_app/utilities/t_keys.g.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> cleanCartPop(BuildContext context,
    ProdectController prodectController, ThemeData theme) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: theme.colorScheme.background,
        backgroundColor: theme.colorScheme.background,
        title: Row(
          children: [
            const Icon(
              Icons.warning,
              color: Constants.kGoldColor,
            ),
            const SizedBox(width: 8),
            customText(
                text: LocaleKeys.confirmation.tr,
                fontColor: theme.colorScheme.primary,
                fontSize: Constants.textVeryLarge),
          ],
        ),
        content: customText(
            text: LocaleKeys.doYouWantToCleanYuorCard.tr,
            fontColor: theme.colorScheme.primary),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
              // Add your action for 'No' button here
            },
            child: Text(LocaleKeys.cancel.tr),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              prodectController.clearCardProdect();
              // Add your action for 'Yes' button here
            },
            child: Text(LocaleKeys.okey.tr),
          ),
        ],
      );
    },
  );
}

// class CleanCartPop extends StatelessWidget {
//   const CleanCartPop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }