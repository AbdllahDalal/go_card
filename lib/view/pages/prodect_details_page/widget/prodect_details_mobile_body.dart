import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/prodect_controller.dart';
import '../../../../models/prodect_modle.dart';

import '../../../../utilities/constants.dart';
import '../../../../utilities/t_keys.g.dart';
import '../../../widget/share_compont/custom_appbare.dart';
import '../../../widget/share_compont/custom_text.dart';
import '../../../widget/share_compont/total_price_card.dart';
import 'float_app_bar.dart';
import 'prodect_slider.dart';
import 'specification_column.dart';
import 'specification_row.dart';

// ignore: must_be_immutable
class ProdectDetailsMobileBody extends StatelessWidget {
  ProdectDetailsMobileBody({
    super.key,
    required ThemeData theme,
    required this.prodect,
    required this.tag,
    required ProdectController prodectController,
    required this.keySca,
  })  : _theme = theme,
        _prodectController = prodectController;

  final ThemeData _theme;
  final Prodect prodect;
  final String tag;
  final ProdectController _prodectController;
  final GlobalKey<ScaffoldState> keySca;

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        key: key,
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width >= 700 ? 100 : 0),
                    color: _theme.colorScheme.primaryContainer,
                    child: ProdectImagesSlider(
                      prodect: prodect, tag: tag,
                      // widgetKey: cartKey,
                    ),
                  ),
                  customAppBarshape(context,
                      topColor: _theme.colorScheme.primaryContainer),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                            text: prodect.name,
                            fontSize: Constants.textVeryLarge,
                            fontColor: _theme.colorScheme.primary,
                            textAlign: TextAlign.start,
                            fontFamily: true,
                            fontWeight: FontWeight.w700),
                        const SizedBox(
                          height: 10,
                        ),
                        customText(
                            text: prodect.discreption,
                            fontColor: _theme.colorScheme.primary,
                            textAlign: TextAlign.start),
                        const SizedBox(
                          height: 15,
                        ),
                        prodect.colors.isNotEmpty
                            ? SpecificationRow(
                                options: prodect.colors,
                                title: LocaleKeys.availibleColor.tr,
                                typeColors: true,
                                rowWidth: 200,
                              )
                            : const SizedBox(),
                        prodect.specifications.isNotEmpty
                            ? Column(
                                children: specificationColumn(
                                    prodect.specifications,
                                    200), //size.width - 130
                              )
                            : const SizedBox()
                      ],
                    ),
                  )
                ],
              ),
            )),
            TotalPriceCard(
              iconData: Icons.shopping_cart_outlined,
              title: LocaleKeys.addToCard.tr,
              price: prodect.price,
              increaseQuantity: true,
              onPressed: () {
                _prodectController.addProdectToCard(prodect);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 1),
                  content: customText(
                      text: "Add ${prodect.name.capitalize} to Card",
                      fontColor: _theme.colorScheme.primary,
                      textAlign: TextAlign.start),
                  backgroundColor: _theme.colorScheme.background,
                ));
              },
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        // ignore: sized_box_for_whitespace
        floatingActionButton: FloatAppBar());
  }
}

// ignore: non_constant_identifier_names

