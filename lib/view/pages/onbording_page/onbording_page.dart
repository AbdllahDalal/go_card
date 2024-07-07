import 'package:dream_store_app/models/onbording_modle.dart';
import 'package:dream_store_app/routers/routers.dart';
import 'package:dream_store_app/view/pages/onbording_page/widget/onbording_mobile_body.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_appbare.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../responsive_layout.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/t_keys.g.dart';
import 'widget/onbording_tablet_body.dart';

List<OnBordingModle> sliderData = [
  OnBordingModle(
      LocaleKeys.onBoradingSlider_1.tr, Constants.onBoradingSliderImage_1),
  OnBordingModle(
      LocaleKeys.onBoradingSlider_2.tr, Constants.onBoradingSliderImage_2),
  OnBordingModle(
      LocaleKeys.onBoradingSlider_3.tr, Constants.onBoradingSliderImage_3),
  OnBordingModle(
      LocaleKeys.onBoradingSlider_4.tr, Constants.onBoradingSliderImage_4),
];

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  late PageController _pageController;
  String skip = LocaleKeys.skip.tr;
  late Size size;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return PageView.builder(
      itemCount: sliderData.length,
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
          skip = index == sliderData.length - 1
              ? LocaleKeys.goToHome.tr
              : LocaleKeys.skip.tr;
        });
      },
      itemBuilder: (context, index) => Scaffold(
          backgroundColor: Constants.kPrimaryColor,
          appBar: customAppBar(
            "",
            context,
            actions: [
              InkWell(
                onTap: () => Get.offNamed(RoutesClass.getTabsPageRoute()),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: customText(
                      text: skip,
                      fontColor: Constants.kTextColor,
                      fontSize: size.width < 700
                          ? Constants.textLarge
                          : Constants.textVeryLarge,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          body: ResponsiveLayout(
            mobileBody: OnbordingMobileBody(
                index: index, size: size, currentIndex: currentIndex),
            tabletBody: OnbordingTabletBody(
                index: index, size: size, currentIndex: currentIndex),
          )),
    );
  }
}
