import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import 'custom_text.dart';

customSliverAppBar(context, title,
    {Widget? leading, List<Widget>? actions, bool? drag = true}) {
  return SliverAppBar(
    backgroundColor: Colors.transparent,
    toolbarHeight: drag! ? 0 : 56,
    pinned: true,
    centerTitle: false,
    expandedHeight: 56,
    floating: true,
    flexibleSpace:
        customAppBar(title, context, leading: leading, actions: actions),
  );
}

AppBar customAppBar(
  title,
  context, {
  Widget? leading,
  List<Widget>? actions,
  double? radiusAngle,
  Color? backgroundColor = Constants.kPrimaryColor,
  Color? fontColor = Constants.kTextColor,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    toolbarHeight: 58,
    centerTitle: true,
    backgroundColor: backgroundColor,
    surfaceTintColor: backgroundColor,
    title: customText(
        text: title,
        fontColor: fontColor,
        fontSize: Constants.textVeryLarge,
        fontWeight: FontWeight.w700,
        fontFamily: true),
    leading: leading,
    actions: actions,
  );
}

SliverAppBar customSliverAppBarshape(BuildContext context) {
  return SliverAppBar(
    automaticallyImplyLeading: false,
    expandedHeight: 0,
    pinned: true,
    toolbarHeight: 0,
    flexibleSpace: FlexibleSpaceBar(
      background: customAppBarshape(context),
    ),
  );
}

Stack customAppBarshape(BuildContext context,
    {Color? topColor = Constants.kPrimaryColor}) {
  return Stack(
    children: [
      Container(
        height: 30,
        color: topColor,
      ),
      Container(
        height: 30,
        // margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
      ),
    ],
  );
}
