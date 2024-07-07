import 'package:flutter/material.dart';

import '../../../widget/share_compont/custom_text.dart';

// ignore: must_be_immutable
class ListTitle extends StatelessWidget {
  ListTitle(
      {super.key,
      required this.title,
      required this.imageIcon,
      required this.onTap});
  final String title;
  final String imageIcon;
  final VoidCallback onTap;

  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Image.asset(
          imageIcon,
          width: 30,
        ),
        title: customText(
            text: title,
            fontColor: _theme.colorScheme.primary,
            textAlign: TextAlign.start),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 22,
          color: _theme.colorScheme.primary,
        ),
      ),
    );
  }
}
