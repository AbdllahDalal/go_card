import 'package:dream_store_app/utilities/app_data.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_appbare.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/t_keys.g.dart';
import 'widget/categories_card_viwe.dart';

// ignore: must_be_immutable
class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  late Size size;

  late int row;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    row = 1;
    if (size.width >= 600 && size.width < 1150) {
      row = 2;
    } else if (size.width > 1150) {
      row = 3;
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          customSliverAppBar(context, LocaleKeys.category.tr),
          customSliverAppBarshape(context),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: size.width / row,
                  childAspectRatio: 23 / 11,
                  crossAxisSpacing: 10),
              itemCount: categories.length,
              itemBuilder: (context, index) => CategoriesCardview(
                category: categories[index],
                index: index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
