import 'package:flutter/material.dart';

class Constants {
  // primary Colors
  static const kPrimaryColor = Color(0xFF219EBC);
  static const kSecondaryColor = Color(0xFF40BAD5);

//  light theme Colors
  static const kBackgroundColor = Colors.white;
  static const kPrimaryContainerColor = Color(0xFFF5F5F5);
  static const kContainerColor = Color(0xFFDFDFDF);
  static const kSecondaryContainerColor = Color(0xFF616161);

//  dark theme Colors
  static const kDarkBackgroundColor = Color(0xFF24323B);
  static const kDarkPrimaryContainerColor = Color(0xFF253A47);
  static const kDarkContainerColor = Color(0xFF274A5F);
  static const kDarkSecondaryContainerColor = Color(0xFFEEEEEE);

  // Text Colors
  static const kTextColor = Color(0xFFFFFFFF);
  static const kTextDarkColor = Color(0xFF000000);
  static const kGoldColor = Color(0xFFfcca46);
  static const kGranTextColor = Color(0xFF757575);

  // asset images routers  unsplash

  // app logo my desige
  static const splashPageImage = "assets/images/splash page.png";

  // onborading images from freepik.com
  static const onBoradingSliderImage_1 = "assets/images/shop.png";
  static const onBoradingSliderImage_2 = "assets/images/shoping_people.png";
  static const onBoradingSliderImage_3 = "assets/images/shoping.png";
  static const onBoradingSliderImage_4 = "assets/images/delivery2.png";

  // AI images from freepik.com
  static const askAIImage = "assets/images/Ask_Ai.jpg";
  static const askAIDarkImage = "assets/images/Ask_Ai.jpg";

  // sign image from freepik.com
  static const signImage = 'assets/images/friendship.png';

  // countries flag from flaticon.com
  static const usaFlagImage = 'assets/images/usa.png';
  static const saudiFlagImage = 'assets/images/saudi-arabia.png';
  static const chinaFlagImage = 'assets/images/china.png';
  static const franceFlagImage = 'assets/images/france.png';
  static const germanyFlagImage = 'assets/images/germany.png';
  static const russiaFlagImage = 'assets/images/russia.png';

  // asset icons image routers from flaticon.com
  static const bellIconImage = "assets/icons/3d-bell.png";
  static const paymentIconImage = "assets/icons/payment.png";
  static const orderIconImage = "assets/icons/order.png";
  static const truckIconImage = "assets/icons/delivery-truck.png";
  static const darkModeIconImage = "assets/icons/night-mode_icon.png";
  static const globalIconImage = "assets/icons/global-network.png";
  static const noteIconImage = "assets/icons/note_icon.png";
  static const shareIconImage = "assets/icons/share_icon.png";
  static const cashOnDeliveryIconImage = "assets/icons/cash-on-delivery.png";
  static const walletIconImage = "assets/icons/wallet.png";
  static const cardIconImage = "assets/icons/card.png";
  static const locationIconImage = "assets/icons/location.png";

  // Text Sizes
  static const double textVeryLarge = 22;
  static const double textLarge = 20;
  static const double textMedium = 18;
  static const double textSmall = 16;
  static const double textVerySmall = 14;
}

LinearGradient gradientshodw = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.black.withOpacity(0),
      Colors.black.withOpacity(0.7),
    ],
    stops: const [
      0.6,
      1
    ]);
