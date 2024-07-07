import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IncreaseDecreaseIcon extends StatelessWidget {
  IncreaseDecreaseIcon({
    super.key,
    required this.onPressed,
    required this.iconData,
  });
  final VoidCallback onPressed;
  final IconData iconData;

  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return SizedBox(
      width: 45,
      height: 45,
      child: Card(
        shape: const OvalBorder(side: BorderSide.none),
        color: _theme.colorScheme.primaryContainer,
        surfaceTintColor: _theme.colorScheme.primaryContainer,
        elevation: 6,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
            size: 20,
            color: _theme.colorScheme.primary,
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  _theme.colorScheme.primaryContainer)),
        ),
      ),
    );
  }
}
