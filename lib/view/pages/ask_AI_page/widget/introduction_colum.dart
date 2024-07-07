import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants.dart';
import '../../../../utilities/t_keys.g.dart';
import '../../../widget/share_compont/custom_text.dart';

class IntroductionColum extends StatelessWidget {
  const IntroductionColum({
    super.key,
    required ThemeData theme,
  }) : _theme = theme;

  final ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 55.0,
            backgroundImage: _theme.colorScheme.primary == Constants.kTextColor
                ? const AssetImage(Constants.askAIDarkImage)
                : const AssetImage(Constants.askAIImage),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: customText(
              text: LocaleKeys
                  .storeAIYourDigitalAssistantBasedArtificialIntelligence.tr,
              fontColor: _theme.colorScheme.primary,
              fontSize: Constants.textLarge),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: customText(
              text: LocaleKeys.hereAreSomeIdeasToGetStarted.tr,
              fontColor: _theme.colorScheme.primary,
              fontSize: Constants.textLarge),
        ),
        SuggestionsText(
          theme: _theme,
          text: 'Best-Selling Products in the Summer',
        ),
        SuggestionsText(
          theme: _theme,
          text: 'Men\'s Wristwatch Suitable for a Black Suit',
        ),
        SuggestionsText(
          theme: _theme,
          text: 'Compare Prices of the Best Headphones in the Store',
        ),
      ],
    );
  }
}

class SuggestionsText extends StatelessWidget {
  const SuggestionsText({
    super.key,
    required ThemeData theme,
    required this.text,
  }) : _theme = theme;

  final ThemeData _theme;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: _theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      child: customText(text: text, fontColor: _theme.colorScheme.primary),
    );
  }
}
