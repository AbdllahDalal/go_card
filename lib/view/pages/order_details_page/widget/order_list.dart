import 'package:dream_store_app/models/card_prodect_modle.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants.dart';
import '../../../../utilities/t_keys.g.dart';

// ignore: must_be_immutable
class OrderList extends StatelessWidget {
  final CardProdect cardProdect;
  final int index;
  OrderList({super.key, required this.cardProdect, required this.index});
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              customText(
                  text: "${index + 1} ", fontColor: _theme.colorScheme.primary),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: customText(
                        text: cardProdect.prodect.name,
                        fontColor: _theme.colorScheme.primary,
                        textAlign: TextAlign.start),
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      PropertyText(
                          text: LocaleKeys.quantity.tr,
                          value: "${cardProdect.quantity}"),
                      Row(
                        children: [
                          Text(
                            LocaleKeys.color.tr,
                            style: const TextStyle(
                                color: Constants.kGranTextColor),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            padding: const EdgeInsets.all(3),
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    spreadRadius: 4)
                              ],
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: cardProdect.prodect
                                        .colors[cardProdect.colorIndex])),
                          )
                        ],
                      ),
                      Column(
                        children:
                            specificationColumn(cardProdect.specifications),
                      )
                    ],
                  )),
              Expanded(
                child: customText(
                    text:
                        "\$${cardProdect.prodect.price * cardProdect.quantity}",
                    fontColor: _theme.colorScheme.primary),
              )
            ],
          ),
        ),
        line(marginX: 5)
      ],
    );
  }
}

class PropertyText extends StatelessWidget {
  const PropertyText({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        "$text:  ",
        style: const TextStyle(
          color: Constants.kGranTextColor,
        ),
        textAlign: TextAlign.start,
      ),
      Text(
        value,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        textAlign: TextAlign.start,
      ),
    ]);
  }
}

List<Widget> specificationColumn(Map specificationMap) {
  List<Widget> specification = [];
  for (int i = 0; i < specificationMap.length; i++) {
    specification.add(PropertyText(
      text: specificationMap.keys.toList(growable: false)[i],
      value: specificationMap[specificationMap.keys.toList(growable: false)[i]],
    ));
  }
  return specification;
}
