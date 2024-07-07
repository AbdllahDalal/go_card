import 'package:dream_store_app/controller/prodect_controller.dart';
import 'package:dream_store_app/models/card_prodect_modle.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routers/routers.dart';
import '../../../../utilities/constants.dart';
import '../../../widget/share_compont/Increase_Decrease_Icon.dart';

class CartProdectCard extends StatefulWidget {
  const CartProdectCard(
      {super.key, required this.cardProdect, required this.index});
  final int index;
  final CardProdect cardProdect;

  @override
  State<CartProdectCard> createState() => _CartProdectCardState();
}

class _CartProdectCardState extends State<CartProdectCard> {
  // late int quantity = 1;

  // late bool select = false;
  final ProdectController _prodectController = Get.find();
  late ThemeData _theme;
  // late List h;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          _prodectController.cleanColorIndex();
          Get.toNamed(
            RoutesClass.getProdectDatailsPageRoute(),
            arguments: {
              'prodect': widget.cardProdect.prodect,
              "tag": "${widget.cardProdect.image} ${widget.index}"
            },
          );
        },
        child: Stack(
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              elevation: 6,
              color: _theme.colorScheme.primaryContainer,
              surfaceTintColor: _theme.colorScheme.primaryContainer,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Hero(
                        tag: "${widget.cardProdect.image} ${widget.index}",
                        child: CircleAvatar(
                          maxRadius: 500,
                          backgroundImage: NetworkImage(
                            widget.cardProdect.image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                text: widget.cardProdect.prodect.name,
                                textAlign: TextAlign.start,
                                fontColor: _theme.colorScheme.primary),
                            customText(
                                text:
                                    "\$${widget.cardProdect.prodect.price * widget.cardProdect.quantity}",
                                textAlign: TextAlign.start,
                                fontColor: Constants.kGoldColor),
                          ],
                        ),
                      )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IncreaseDecreaseIcon(
                        iconData: CupertinoIcons.add,
                        onPressed: () {
                          _prodectController.increaseQuantityCard(widget.index);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GetBuilder<ProdectController>(
                          init: ProdectController(),
                          builder: (controller) => customText(
                              text:
                                  "${_prodectController.cardprodects[widget.index].quantity}",
                              fontColor: _theme.colorScheme.primary),
                        ),
                      ),
                      IncreaseDecreaseIcon(
                          onPressed: () {
                            _prodectController
                                .decreaseQuantityCard(widget.index);
                          },
                          iconData: CupertinoIcons.minus),
                    ],
                  )),
                ],
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                    onPressed: () {
                      _prodectController.removeCardProdect(widget.index);
                    },
                    icon: const Icon(
                      Icons.dangerous,
                      color: Constants.kGranTextColor,
                    )))
          ],
        ),
      ),
    );
  }
}
