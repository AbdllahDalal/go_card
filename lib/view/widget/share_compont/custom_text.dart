import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

Widget customText(
    {required String text,
    Color? fontColor = Constants.kTextColor,
    double? fontSize = Constants.textSmall,
    int? maxLines = 1000000,
    FontWeight? fontWeight = FontWeight.w500,
    TextAlign? textAlign = TextAlign.center,
    bool? fontFamily = true}) {
  return Text(
    text,
    style: TextStyle(
        color: fontColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: fontFamily! ? 'NotoSerif' : null),
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
    maxLines: maxLines,
  );
}

Padding line({double? marginX, double? marginY}) {
  return Padding(
    padding:
        EdgeInsets.symmetric(horizontal: marginX ?? 20, vertical: marginY ?? 0),
    child: const Divider(
      color: Colors.grey,
    ),
  );
}
