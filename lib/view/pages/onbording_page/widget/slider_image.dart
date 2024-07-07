import 'dart:math';

import 'package:flutter/material.dart';

import '../onbording_page.dart';

// ignore: must_be_immutable
class SliderImage extends StatelessWidget {
  SliderImage({super.key, required this.index, required this.size});
  final int index;
  final Size size;

  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(30),
          // height: double.infinity,
          height: min(size.width, 600),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: _theme.colorScheme.background),
        ),
        Image.asset(
          sliderData[index].image,
          // width: min(size.width, 600),
          height: min(size.width, 600),
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
