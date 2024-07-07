import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../controller/prodect_controller.dart';
import '../../../../routers/routers.dart';
import '../../../../utilities/constants.dart';
import '../../../widget/share_compont/custem_cart_icon.dart';

class FloatAppBar extends StatelessWidget {
  FloatAppBar({
    super.key,
  });
  final ProdectController _prodectController = Get.find();

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Animate(
      effects: const [
        SlideEffect(
            // delay: Duration(milliseconds: 100),
            begin: Offset(0, -14),
            duration: Duration(milliseconds: 850))
      ],
      // ignore: sized_box_for_whitespace
      child: Container(
        height: 50,
        child: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 5, spreadRadius: 0)
                ]),
                child: const Icon(
                  Icons.arrow_back,
                  color: Constants.kTextColor,
                ),
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed(RoutesClass.getCartPageRoute());
              },
              child: CustemCartIcon(
                iconColor: Constants.kTextColor,
                withShadow: true,
                prodectController: _prodectController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
