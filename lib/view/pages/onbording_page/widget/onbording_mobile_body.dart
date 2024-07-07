import "package:flutter/material.dart";
import 'slider_image.dart';
import 'text_dots_colum.dart';

class OnbordingMobileBody extends StatelessWidget {
  const OnbordingMobileBody(
      {super.key,
      required this.index,
      required this.size,
      required this.currentIndex});
  final int index;
  final Size size;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex: 2, child: SliderImage(index: index, size: size)),
        Expanded(
            child: TextDotsColum(
                index: index, size: size, currentIndex: currentIndex)),
      ],
    );
  }
}
