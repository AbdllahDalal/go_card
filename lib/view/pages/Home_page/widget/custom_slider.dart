import "package:carousel_slider/carousel_slider.dart";
import "package:dream_store_app/utilities/app_data.dart";
import "package:dream_store_app/view/widget/share_compont/custom_text.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

import "../../../../routers/routers.dart";
import "../../../../utilities/constants.dart";

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late Size size;
  late int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width > 720 ? (size.width - 720) / 2 : 0),
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, index, realIndex) => InkWell(
                      onTap: () {
                        Get.toNamed(
                          RoutesClass.getProdectDatailsPageRoute(),
                          arguments: {
                            'prodect': prodects[index],
                            'tag': '${prodects[index].name} sl'
                          },
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 420,
                            width: 570,
                            // margin: EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Hero(
                                  tag: '${prodects[index].name} sl',
                                  child: Image.network(
                                    prodects[index].image[0],
                                    height: 420,
                                    width: 570,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            height: 420,
                            padding: const EdgeInsets.all(12),
                            width: 570,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(15)),
                                gradient: gradientshodw),
                            child: customText(
                                text:
                                    "Headphone Red Color and charger and Case",
                                textAlign: TextAlign.left),
                          )
                        ],
                      ),
                    ),
                options: CarouselOptions(
                  aspectRatio: 27 / 16,
                  // enlargeFactor: 0.1,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlay: true,
                  height: size.width > 720 ? 400 : null,
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
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 5,
        effect: ExpandingDotsEffect(
            dotWidth: 15,
            activeDotColor: Constants.kSecondaryColor,
            dotColor: Theme.of(context).colorScheme.secondaryContainer),
      );
}
