import 'package:flutter/material.dart';

import 'slider_image.dart';
import 'text_dots_colum.dart';

class OnbordingTabletBody extends StatelessWidget {
  const OnbordingTabletBody(
      {super.key,
      required this.index,
      required this.size,
      required this.currentIndex});
  final int index;
  final Size size;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: SliderImage(index: index, size: size)),
        Expanded(
            child: TextDotsColum(
                index: index, size: size, currentIndex: currentIndex)),
      ],
    );
  }
}
