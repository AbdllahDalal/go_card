import 'package:dream_store_app/controller/prodect_controller.dart';
import 'package:dream_store_app/models/prodect_modle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../responsive_layout.dart';
import 'widget/prodect_details_mobile_body.dart';
import 'widget/prodect_details_tablet_body.dart';

class ProdectDetailsPage extends StatefulWidget {
  const ProdectDetailsPage({
    super.key,
  });
  @override
  State<ProdectDetailsPage> createState() => _ProdectDetailsPageState();
}

class _ProdectDetailsPageState extends State<ProdectDetailsPage> {
  late Map<String, dynamic> routeArgument;
  late Prodect prodect;
  late String tag;
  late final ProdectController _prodectController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();

  late ThemeData _theme;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _prodectController.cleanQuantity();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    prodect = routeArgument['prodect'];
    tag = routeArgument['tag'];
    _prodectController.selectSpecifications = (prodect.specifications.isNotEmpty
        ? prodect.specifications.map((key, value) => MapEntry(key, value[0]))
        : {});

    return ResponsiveLayout(
      mobileBody: ProdectDetailsMobileBody(
        theme: _theme,
        prodect: prodect,
        tag: tag,
        prodectController: _prodectController,
        keySca: _scaffoldKey1,
      ),
      tabletBody: ProdectDetailsTableBody(
        theme: _theme,
        prodect: prodect,
        tag: tag,
        prodectController: _prodectController,
        keySca: _scaffoldKey2,
      ),
    );
  }
}
