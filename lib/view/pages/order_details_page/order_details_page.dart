import 'package:dream_store_app/utilities/app_data.dart';
import 'package:dream_store_app/controller/prodect_controller.dart';
import 'package:dream_store_app/routers/routers.dart';
import 'package:dream_store_app/view/pages/order_details_page/widget/order_list.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/card_prodect_modle.dart';
import '../../../utilities/t_keys.g.dart';
import '../../widget/share_compont/custom_appbare.dart';
import '../../widget/share_compont/custom_text.dart';
import 'widget/card_colum.dart';
import 'widget/radio_liste.dart';

// ignore: must_be_immutable
class OrderDetailsPage extends StatelessWidget {
  OrderDetailsPage({super.key});

  late Map<String, dynamic> routeArgument;

  late double totalPrice;
  late double taxes;
  late double totalPriceWithTaxes;
  late List<CardProdect> orderProdects;
  late bool reviewOrder;
  late final ProdectController _prodectController = Get.find();
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    // _prodectController = Provider.of(context);
    routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    totalPrice = routeArgument['totalPrice'];
    taxes = routeArgument['taxes'];
    totalPriceWithTaxes = routeArgument['totalPriceWithTaxes'];
    orderProdects = routeArgument["orderProdects"];
    reviewOrder = routeArgument["reviewOrder"];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          customSliverAppBar(
            context,
            LocaleKeys.orderDetails.tr,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          customSliverAppBarshape(context),
          CardColum(theme: _theme, title: LocaleKeys.orderProdect.tr, column: [
            Column(
              children: orderProdects
                  .map<Widget>((e) => OrderList(
                        cardProdect: e,
                        index: orderProdects.indexOf(e),
                      ))
                  .toList(),
            ),
            Column(
              children: [
                totalPriceRow(LocaleKeys.totalPrice.tr, totalPrice),
                Visibility(
                    visible: !reviewOrder,
                    child: totalPriceRow(LocaleKeys.taxes.tr, taxes)),
                Visibility(
                    visible: !reviewOrder,
                    child: totalPriceRow(
                        LocaleKeys.finalPrice.tr, totalPriceWithTaxes)),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ]),
          Visibility(
            replacement: const SliverToBoxAdapter(),
            visible: !reviewOrder,
            child: CardColum(
              theme: _theme,
              title: LocaleKeys.paymentMethod.tr,
              column: [
                RadioListe(
                  text: LocaleKeys.cashOnDelivery.tr,
                  prodectController: _prodectController,
                  value: LocaleKeys.cashOnDelivery,
                  purpose: 'payment',
                ),
                RadioListe(
                  text: LocaleKeys.creditCard.tr,
                  prodectController: _prodectController,
                  value: LocaleKeys.creditCard,
                  purpose: 'payment',
                ),
                RadioListe(
                  text: LocaleKeys.buyNowAndPayLater.tr,
                  prodectController: _prodectController,
                  value: LocaleKeys.buyNowAndPayLater,
                  purpose: 'payment',
                ),
                RadioListe(
                  text: LocaleKeys.payPal,
                  prodectController: _prodectController,
                  value: LocaleKeys.payPal,
                  purpose: 'payment',
                ),
              ],
            ),
          ),
          Visibility(
            replacement: const SliverToBoxAdapter(),
            visible: !reviewOrder,
            child: CardColum(
                theme: _theme,
                title: LocaleKeys.deliveryLocation.tr,
                column: [
                  Column(
                      children: locations
                          .map(
                            (e) => RadioListe(
                              text: e.locationName,
                              prodectController: _prodectController,
                              value: e.id.toString(),
                              purpose: 'location',
                            ),
                          )
                          .toList()),
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(
                            RoutesClass.getDeliveryLocalitionPageRoute());
                      },
                      child: customText(
                          text: LocaleKeys.addLocation.tr,
                          fontColor: Colors.blue),
                    ),
                  )
                ]),
          ),
          Visibility(
            replacement: const SliverToBoxAdapter(),
            visible: !reviewOrder,
            child: SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: CustomButton(
                  innerText: LocaleKeys.continuous,
                  onPressed: () {
                    if (locations.isNotEmpty) {
                      Get.toNamed(RoutesClass.getPaymentPageRoute(),
                          arguments: {
                            'totalPrice': totalPriceWithTaxes,
                            'paymentMethod': _prodectController.payMethod.tr,
                            'locationName': locations
                                .firstWhere((element) =>
                                    element.id.toString() ==
                                    _prodectController.selectLocation)
                                .locationName
                          });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 3),
                        content: customText(
                            text: LocaleKeys.selectLocationFrist.tr,
                            fontColor: _theme.colorScheme.primary,
                            textAlign: TextAlign.start),
                        backgroundColor: _theme.colorScheme.background,
                      ));
                    }
                  }),
            )),
          )
        ],
      ),
    );
  }

  Row totalPriceRow(String text, double price) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: customText(
                text: text,
                fontColor: _theme.colorScheme.primary,
                textAlign: TextAlign.start),
          ),
        ),
        Expanded(
          child: customText(
            text: "\$${price.toStringAsFixed(2)}",
            fontColor: _theme.colorScheme.primary,
          ),
        )
      ],
    );
  }
}
