import 'package:dream_store_app/utilities/app_data.dart';
import 'package:dream_store_app/view/widget/dialog/done_pay_pop.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_appbare.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/prodect_controller.dart';
import '../../../models/card_prodect_modle.dart';
import '../../../models/order_modle.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/t_keys.g.dart';

// ignore: must_be_immutable
class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});
  late ThemeData _theme;
  late Size size;
  late Map<String, dynamic> routeArgument;

  late double totalPrice;
  late String paymentMethod;
  late String locationName;
  late final ProdectController _prodectController = Get.find();
  @override
  Widget build(BuildContext context) {
    routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    totalPrice = routeArgument['totalPrice'];
    paymentMethod = routeArgument['paymentMethod'];
    locationName = routeArgument['locationName'];
    size = MediaQuery.of(context).size;
    _theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Constants.kPrimaryColor,
      appBar: customAppBar(
        LocaleKeys.pay.tr,
        context,
        backgroundColor: _theme.colorScheme.background,
        fontColor: _theme.colorScheme.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: _theme.colorScheme.primary,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        // ignore: sized_box_for_whitespace
        child: Container(
          height: size.height - 85,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: _theme.colorScheme.background),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'US\$$totalPrice',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: _theme.colorScheme.primary),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        customText(
                            text: LocaleKeys.paymentMethod.tr,
                            fontColor: _theme.colorScheme.primary),
                        customText(
                            text: "  :  ",
                            fontColor: _theme.colorScheme.primary),
                        customText(
                            text: paymentMethod,
                            fontColor: _theme.colorScheme.primary),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        customText(
                            text: LocaleKeys.deliveryLocation.tr,
                            fontColor: _theme.colorScheme.primary),
                        customText(
                            text: "  :  ",
                            fontColor: _theme.colorScheme.primary),
                        customText(
                            text: locationName,
                            fontColor: _theme.colorScheme.primary),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          List<CardProdect> pro = _prodectController
                              .cardprodects
                              .map((e) => CardProdect.fromMap(e.toMap()))
                              .toList();
                          orders.add(Order(
                              id: "20220428-06353357",
                              date: DateFormat("yyyy-MM-dd")
                                  .format(DateTime.now()),
                              paymentStatus: paymentStatusList[1],
                              deliveryStatus: deliveryStatusList[1],
                              amount: totalPrice,
                              prodects: pro));

                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => DonePayPop());
                          // Action for pay button
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.kSecondaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100.0, vertical: 16.0),
                        ),
                        child: customText(text: LocaleKeys.pay),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Constants.kPrimaryColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                  ),
                  height: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
