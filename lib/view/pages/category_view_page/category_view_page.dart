import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:dream_store_app/utilities/app_data.dart';
import 'package:dream_store_app/models/prodect_modle.dart';
import 'package:dream_store_app/view/pages/category_view_page/widget/category_row.dart';
import 'package:dream_store_app/view/widget/share_compont/prodect_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/prodect_controller.dart';
import '../../../models/category_modle.dart';
import '../../../routers/routers.dart';
import '../../../utilities/constants.dart';
import '../../widget/share_compont/custem_cart_icon.dart';
import '../../widget/share_compont/custom_appbare.dart';
import '../../widget/share_compont/custom_text.dart';

// ignore: must_be_immutable
class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  late Map<String, dynamic> routeArgument;
  late Category category;
  late List<Prodect> prodectse;
  late ThemeData _theme;
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  final ProdectController _prodectController = Get.find();
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    category = routeArgument['category'];
    prodectse =
        prodects.where((element) => element.categoryId == category.id).toList();
    return AddToCartAnimation(
      cartKey: cartKey,
      width: 10,
      height: 10,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: false,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
          backgroundColor: _theme.colorScheme.background,
          body: CustomScrollView(slivers: [
            customSliverAppBar(context, category.categoryName,
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
                  InkWell(
                    onTap: () => Get.toNamed(RoutesClass.getCartPageRoute()),
                    child: Container(
                      key: cartKey,
                      child: CustemCartIcon(
                        iconColor: Constants.kTextColor,
                        prodectController: _prodectController,
                      ),
                    ),
                  ),
                ]),
            customSliverAppBarshape(context),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: IconButton(
                        onPressed: () {
                          // showModalBottomSheet(
                          //     backgroundColor: Colors.transparent,
                          //     isScrollControlled: true,
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       // return SortBySheet();
                          //     });
                        },
                        icon: const Icon(
                          Icons.filter_list,
                          size: 27,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    CategoryRow(),
                  ],
                ),
                line(marginX: 20, marginY: 5),
              ],
            )),
            ProdectGrid(
              prodectse: prodectse,
              onClick: listClick,
            ),
          ])),
    );
  }

  void listClick(GlobalKey widgetKey) async {
    await runAddToCartAnimation(widgetKey);
  }
}
