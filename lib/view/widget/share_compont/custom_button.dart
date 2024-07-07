import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

class CustomButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;
  const CustomButton(
      {super.key, required this.innerText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Constants.kSecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
          onPressed: onPressed,
          child: customText(text: innerText, fontSize: Constants.textLarge)),
    );
  }
}
