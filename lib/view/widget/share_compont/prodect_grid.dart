import 'package:flutter/material.dart';

import '../../../models/prodect_modle.dart';
import 'prodect_view.dart';

class ProdectGrid extends StatelessWidget {
  ProdectGrid({
    super.key,
    required this.prodectse,
    required this.onClick,
  });
  final GlobalKey widgetKey = GlobalKey();
  final void Function(GlobalKey) onClick;
  final List<Prodect> prodectse;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 25),
      sliver: SliverGrid.builder(
          itemCount: prodectse.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 9 / 15,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          itemBuilder: (context, index) => ProdectView(
                prodect: prodectse[index],
                onClick: onClick,
              )),
    );
  }
}
