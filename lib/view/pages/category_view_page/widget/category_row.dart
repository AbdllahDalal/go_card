import '/utilities/app_data.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryRow extends StatelessWidget {
  CategoryRow({
    super.key,
  });

  late Size size;
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _theme = Theme.of(context);
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 6),
      width: size.width - 60,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: _theme.colorScheme.primaryContainer ==
                        const Color.fromRGBO(37, 58, 71, 1)
                    ? _theme.colorScheme.primaryContainer
                    : Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: customText(
                text: categories[i].categoryName,
                fontColor: _theme.colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
