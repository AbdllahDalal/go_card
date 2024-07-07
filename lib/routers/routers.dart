import 'package:dream_store_app/view/pages/notification_page/notification_page.dart';
import 'package:dream_store_app/view/pages/sign_pages/sign_up_screen.dart';
import 'package:dream_store_app/view/pages/tabs_page/tabs_page.dart';
import 'package:get/get.dart';
import '../view/pages/cart_page/cart_page.dart';
import '../view/pages/category_view_page/category_view_page.dart';
import '../view/pages/credit_card_page/credit_card_page.dart';
import '../view/pages/delivery_location_page/delivery_location_page.dart';
import '../view/pages/map_page/map_page.dart';
import '../view/pages/onbording_page/onbording_page.dart';
import '../view/pages/order_details_page/order_details_page.dart';
import '../view/pages/orders_list_page/orders_list_page.dart';
import '../view/pages/payment_page/payment_page.dart';
import '../view/pages/prodect_details_page/prodect_details_page.dart';
import '../view/pages/ask_AI_page/ask_ai_page.dart';
import '../view/pages/set_lang_page/set_lang_page.dart';
import '../view/pages/sign_pages/sign_in_screen.dart';
import '../view/pages/splash_screen/splash_screen.dart';

class RoutesClass {
  static String splashPage = "/";
  static String getsplashPageRoute() => splashPage;

  static String onBordingPage = "/onBordingPage";
  static String getOnBordingPageRoute() => onBordingPage;

  static String tabsPage = "/tabsPages";
  static String getTabsPageRoute() => tabsPage;

  static String askAIPage = "/askAIPage";
  static String getAskAIPageRoute() => askAIPage;

  static String cartPage = "/cartPage";
  static String getCartPageRoute() => cartPage;

  static String prodectDatailsPage = "/prodectDatailsPage";
  static String getProdectDatailsPageRoute() => prodectDatailsPage;

  static String signInPage = "/signInPage";
  static String getSignInPageRoute() => signInPage;

  static String signUpPage = "/signUpPage";
  static String getSignUpPageRoute() => signUpPage;

  static String orderDetailsPage = "/orderDetailsPage";
  static String getOrderDetailsPageRoute() => orderDetailsPage;

  static String prodectByCategoryPage = "/prodectByCategoryPage";
  static String getProdectByCategoryPageRoute() => prodectByCategoryPage;

  static String deliveryLocalitionPage = "/deliveryLocalitionPage";
  static String getDeliveryLocalitionPageRoute() => deliveryLocalitionPage;

  static String notificationPage = "/notificationPage";
  static String getNotificationPageRoute() => notificationPage;

  static String creditCardPage = "/creditCardPage";
  static String getCreditCardPageRoute() => creditCardPage;

  static String ordersListPage = "/ordersListPage";
  static String getOrdersListPageRoute() => ordersListPage;

  static String setLangPage = "/setLangPage";
  static String getSetLangPageRoute() => setLangPage;

  static String mapPage = "/mapPage";
  static String getMapPageRoute() => mapPage;
  static String paymentPage = "/paymentPage";
  static String getPaymentPageRoute() => paymentPage;

  static List<GetPage> routes = [
    GetPage(name: getsplashPageRoute(), page: () => const SplashScreen()),
    GetPage(name: getOnBordingPageRoute(), page: () => const OnBoardingPage()),
    GetPage(name: getTabsPageRoute(), page: () => const TabsPage()),
    GetPage(name: getAskAIPageRoute(), page: () => const AskAIPage()),
    GetPage(name: getCartPageRoute(), page: () => const CartPage()),
    GetPage(
        name: getProdectDatailsPageRoute(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 900),
        page: () => const ProdectDetailsPage()),
    GetPage(name: getSignInPageRoute(), page: () => SignInScreen()),
    GetPage(name: getSignUpPageRoute(), page: () => SignUpScreen()),
    GetPage(name: getProdectByCategoryPageRoute(), page: () => CategoryPage()),
    GetPage(name: getOrderDetailsPageRoute(), page: () => OrderDetailsPage()),
    GetPage(
        name: getDeliveryLocalitionPageRoute(),
        page: () => DeliveryLocationPage()),
    GetPage(name: getNotificationPageRoute(), page: () => NotificationPage()),
    GetPage(name: getCreditCardPageRoute(), page: () => const CreditCardPage()),
    GetPage(name: getOrdersListPageRoute(), page: () => const OrdersListPage()),
    GetPage(name: getSetLangPageRoute(), page: () => SetLangPage()),
    GetPage(name: getMapPageRoute(), page: () => const MapPage()),
    GetPage(name: getPaymentPageRoute(), page: () => PaymentPage()),
  ];
}
