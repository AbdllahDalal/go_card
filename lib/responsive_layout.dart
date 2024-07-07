import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  const ResponsiveLayout(
      {super.key, required this.mobileBody, required this.tabletBody});

  @override
  Widget build(BuildContext context) {
    bool isOrientation =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (!isOrientation) {
          return mobileBody;
        } else {
          return tabletBody;
        }
      },
    );
  }
}
