import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routers/routers.dart';
import '../../../../models/category_modle.dart';
import '../../../../utilities/constants.dart';

// ignore: must_be_immutable
class CategoriesCardview extends StatelessWidget {
  final Category category;
  final int index;
  CategoriesCardview({super.key, required this.category, required this.index});
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Get.toNamed(
          RoutesClass.getProdectByCategoryPageRoute(),
          arguments: {'category': category},
        );
      },
      child: Card(
        color: Colors.grey[600],
        surfaceTintColor: Colors.grey[600],
        elevation: 6,
        margin: const EdgeInsets.only(bottom: 10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                category.categoryImage,
                height: size.width / 2.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              height: size.width / 2.3,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  gradient: gradientshodw),
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: customText(
                      text: category.categoryName,
                      fontWeight: FontWeight.w500,
                      fontSize: Constants.textLarge,
                      textAlign: TextAlign.start)),
            )
          ],
        ),
      ),
    );
  }
}
