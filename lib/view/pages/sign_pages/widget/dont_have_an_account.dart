import 'package:dream_store_app/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/t_keys.g.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.dontHaveAnAccount.tr,
            style: const TextStyle(
                fontSize: 13,
                color: Color(0xff939393),
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Get.offNamed(RoutesClass.getSignUpPageRoute());
            },
            child: Text(
              LocaleKeys.signUp.tr,
              style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff748288),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
