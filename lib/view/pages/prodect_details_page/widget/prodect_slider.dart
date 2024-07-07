import 'package:carousel_slider/carousel_slider.dart';
import 'package:dream_store_app/controller/prodect_controller.dart';
import 'package:dream_store_app/models/prodect_modle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/utilities/constants.dart';

class ProdectImagesSlider extends StatefulWidget {
  const ProdectImagesSlider({
    super.key,
    required this.prodect,
    required this.tag,
  });
  // final GlobalKey widgetKey;
  final Prodect prodect;
  final String tag;
  @override
  State<ProdectImagesSlider> createState() => _ProdectImagesSliderState();
}

class _ProdectImagesSliderState extends State<ProdectImagesSlider> {
  late Size size;
  late int activeIndex = 0;
  final ProdectController _prodectController = Get.find();
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    // _prodectController = Provider.of(context);
    size = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider(
            carouselController: _prodectController
                .prodectImagesSliderController, // Move to the 3rd item (index 2),
            items: widget.prodect.image
                .map<Widget>(
                  (e) => Hero(
                    tag: widget.tag,
                    child: Image.network(
                      e,
                      height: 2700,
                      width: 2700,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 27 / 27,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlay: false,
              // initialPage: _prodectController.prodectColorIndex,

              onPageChanged: (index, reason) => setState(
                () {
                  activeIndex = index;
                },
              ),
            )),
        SizedBox(
          height: 50,
          child: buildIndicator(),
        )
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.prodect.image.length,
        effect: ExpandingDotsEffect(
            dotWidth: 15,
            activeDotColor: Constants.kSecondaryColor,
            dotColor: _theme.colorScheme.secondaryContainer),
      );
}
