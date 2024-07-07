import 'package:dream_store_app/utilities/app_data.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_appbare.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utilities/t_keys.g.dart';
import '../../widget/share_compont/prodect_grid.dart';
import 'widget/custom_slider.dart';
import 'widget/section_title.dart';

class HomePage extends StatefulWidget {
  // ignore: use_super_parameters
  const HomePage({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  final void Function(GlobalKey) onClick;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.colorScheme.background,
      body: CustomScrollView(
        slivers: [
          customSliverAppBar(context, LocaleKeys.home.tr),
          customSliverAppBarshape(context),
          SectionTitle(title: LocaleKeys.theMostSalesProducts.tr),
          const CustomSlider(),
          SectionTitle(title: LocaleKeys.theNowProducts.tr),
          ProdectGrid(
            prodectse: prodects,
            onClick: widget.onClick,
          ),
        ],
      ),
    );
  }
}
