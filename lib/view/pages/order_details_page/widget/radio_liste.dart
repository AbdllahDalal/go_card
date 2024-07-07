import 'package:dream_store_app/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/prodect_controller.dart';
import '../../../../utilities/constants.dart';
import '../../../widget/share_compont/custom_text.dart';

// ignore: must_be_immutable
class RadioListe extends StatelessWidget {
  final String text;
  final ProdectController prodectController;
  final String value;
  final String purpose;
  RadioListe({
    super.key,
    required this.text,
    required this.prodectController,
    required this.value,
    required this.purpose,
  });

  late ThemeData _theme;
  late bool isPayment;
  late String image;

  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    isPayment = purpose == 'payment';
    _theme = Theme.of(context);
    switch (value) {
      case "Cash On Delivery":
        image = Constants.cashOnDeliveryIconImage;
        break;
      case "Credit Card":
        image = Constants.paymentIconImage;
        break;
      case "Buy Now and Pay Later":
        image = Constants.walletIconImage;
        break;
      case "PayPal":
        image = Constants.cardIconImage;
        break;
      default:
        image = Constants.locationIconImage;
        break;
    }
    return Obx(
      () => RadioListTile(
        secondary: Image.asset(
          image,
          // width: 10,
          height: 50,
          fit: BoxFit.fitHeight,
        ),
        activeColor: Constants.kSecondaryColor,
        title: customText(
            text: text,
            fontColor: _theme.colorScheme.primary,
            textAlign: TextAlign.start),
        value: value,
        groupValue: isPayment
            ? prodectController.payMethod
            : prodectController.selectLocation,
        onChanged: (value) {
          isPayment
              ? prodectController.selectPayMethod(value as String)
              : prodectController.selectlocation(value as String);
          if (value == "Credit Card") {
            Get.toNamed(RoutesClass.getCreditCardPageRoute());
          }
        },
      ),
    );
  }
}
