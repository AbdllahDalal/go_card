import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';

class PriceText extends StatelessWidget {
  const PriceText({
    super.key,
    required this.text,
    required this.price,
  });
  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "$text:  ",
          style: const TextStyle(color: Constants.kGranTextColor)),
      TextSpan(
          text: "\$$price",
          style: TextStyle(color: Theme.of(context).colorScheme.primary)),
    ]));
  }
}
