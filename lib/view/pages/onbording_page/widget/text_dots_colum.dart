import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';
import '../../../widget/share_compont/custom_text.dart';
import '../onbording_page.dart';

class TextDotsColum extends StatelessWidget {
  const TextDotsColum(
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: customText(
              text: sliderData[index].text,
              fontSize: size.width < 700
                  ? Constants.textLarge
                  : Constants.textVeryLarge,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: drawDots(sliderData.length, currentIndex),
        )
      ],
    );
  }

  List<Widget> drawDots(int lounght, int currentIndex) {
    List<Widget> dots = [];
    for (int i = 0; i < lounght; i++) {
      dots.add(Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: i != currentIndex
                ? Constants.kTextColor
                : Constants.kDarkBackgroundColor),
      ));
    }
    return dots;
  }
}
