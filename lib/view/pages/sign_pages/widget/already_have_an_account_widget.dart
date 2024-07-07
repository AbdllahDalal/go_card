import 'package:dream_store_app/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/t_keys.g.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.alreadyHaveAnAccount.tr,
            style: const TextStyle(
                fontSize: 13,
                color: Color(0xff939393),
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Get.offAllNamed(RoutesClass.getSignInPageRoute());
            },
            child: Text(
              LocaleKeys.logIn.tr,
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
