import 'package:dream_store_app/controller/prodect_controller.dart';
import 'package:dream_store_app/locale/locale_controller.dart';
import 'package:dream_store_app/models/prodect_modle.dart';
import 'package:dream_store_app/routers/routers.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';

// ignore: must_be_immutable
class ProdectView extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final void Function(GlobalKey) onClick;
  final Prodect prodect;
  ProdectView({super.key, required this.prodect, required this.onClick});

  late final ProdectController _prodectController = Get.find();
  late final MyLocaleController _myLocaleController =
      Get.put(MyLocaleController());
  late ThemeData _theme;
  late Size size;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        _prodectController.cleanColorIndex();
        Get.toNamed(
          RoutesClass.getProdectDatailsPageRoute(),
          arguments: {'prodect': prodect, 'tag': " ${prodect.image[0]} view "},
        );
      },
      child: Card(
        surfaceTintColor: _theme.colorScheme.primaryContainer,
        color: _theme.colorScheme.primaryContainer,
        margin: const EdgeInsets.only(bottom: 15, right: 7, left: 7),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 10,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Hero(
                tag: " ${prodect.image[0]} view ",
                child: Container(
                  key: widgetKey,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      prodect.image[0],
                      height: 120,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 15,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                        text: prodect.name,
                        fontColor: _theme.colorScheme.primary,
                        fontSize: Constants.textMedium,
                        maxLines: size.width < 350 ? 1 : 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: customText(
                              text: "\$${prodect.price}",
                              fontColor: Colors.amber,
                              fontSize: Constants.textMedium,
                              maxLines: 2),
                        ),
                        Builder(
                          builder: (BuildContext context) => InkWell(
                            onTap: () {
                              onClick(widgetKey);
                              _prodectController.cleanColorIndex();
                              _prodectController.cleanQuantity();
                              _prodectController.selectSpecifications = prodect
                                  .specifications
                                  .map((key, value) => MapEntry(key, value[0]));
                              _prodectController.addProdectToCard(prodect);
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(content: Text(prodect.name)));
                            },
                            child: Container(
                              height: 45,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius:
                                      _myLocaleController.languageData == "ar"
                                          ? const BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              bottomLeft: Radius.circular(15))
                                          : const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomRight:
                                                  Radius.circular(15))),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: _theme.colorScheme.primaryContainer,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
