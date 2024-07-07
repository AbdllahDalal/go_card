import 'package:dream_store_app/controller/prodect_controller.dart';
import 'package:dream_store_app/routers/routers.dart';
import 'package:dream_store_app/view/pages/cart_page/widget/cart_prodect_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/t_keys.g.dart';
import '../../widget/dialog/clean_cart_pop.dart';
import '../../widget/share_compont/custom_appbare.dart';
import '../../widget/share_compont/total_price_card.dart';
import 'widget/price_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Size size;
  // late double totalPrice;
  // late double taxes;
  // late double totalPriceWithTaxes;
  final ProdectController _prodectController = Get.find();
  late ThemeData _theme;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _prodectController.cleanColorIndex();
      _prodectController.cleanQuantity();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    // _prodectController = Provider.of(context);
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _theme.colorScheme.background,
      appBar: customAppBar(LocaleKeys.cart.tr, context,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                onPressed: () {
                  cleanCartPop(context, _prodectController, _theme);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            )
          ]),
      body: Column(
        children: [
          customAppBarshape(context),
          Expanded(
              child: Container(
            decoration: BoxDecoration(color: _theme.colorScheme.background),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GetBuilder<ProdectController>(
                      init: ProdectController(),
                      builder: (controller) => GridView.builder(
                          itemCount: _prodectController.cardprodects.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 500,
                            childAspectRatio: 23 / 11,
                          ),
                          itemBuilder: (context, index) => CartProdectCard(
                                cardProdect:
                                    _prodectController.cardprodects[index],
                                index: index,
                              )),
                    ),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<ProdectController>(
                        init: ProdectController(),
                        builder: (controller) => PriceText(
                          text: LocaleKeys.subtotal.tr,
                          price:
                              _prodectController.totalPrice.toStringAsFixed(2),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GetBuilder<ProdectController>(
                        init: ProdectController(),
                        builder: (controller) => PriceText(
                          text: LocaleKeys.taxes.tr,
                          price: _prodectController.taxes.toStringAsFixed(2),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
          GetBuilder<ProdectController>(
            init: ProdectController(),
            builder: (controller) => TotalPriceCard(
              title: LocaleKeys.checkOut.tr,
              price: _prodectController.totalPriceWithTaxes,
              iconData: Icons.arrow_circle_right_rounded,
              increaseQuantity: false,
              onPressed: () {
                if (_prodectController.cardprodects.isNotEmpty) {
                  Get.toNamed(
                    RoutesClass.getOrderDetailsPageRoute(),
                    arguments: {
                      'totalPrice': _prodectController.totalPrice,
                      'taxes': _prodectController.taxes,
                      'totalPriceWithTaxes':
                          _prodectController.totalPriceWithTaxes,
                      "orderProdects": _prodectController.cardprodects,
                      "reviewOrder": false,
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
