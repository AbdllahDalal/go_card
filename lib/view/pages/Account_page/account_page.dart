import 'package:dream_store_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utilities/t_keys.g.dart';
import '../../../routers/routers.dart';
import '../../widget/dialog/dark_mod_pop.dart';
import '../../widget/share_compont/custom_appbare.dart';
import '../../widget/share_compont/custom_button.dart';
import '../../widget/share_compont/custom_text.dart';
import 'widget/list_title.dart';
import 'widget/pick_image_widget.dart';

// ignore: must_be_immutable
class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.colorScheme.background,
      appBar: customAppBar(LocaleKeys.account.tr, context,
          backgroundColor: _theme.colorScheme.background,
          fontColor: _theme.colorScheme.primary),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PickImageWidget(),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(15),
                child: customText(
                    text: "Abdullah Dalal",
                    fontFamily: true,
                    fontColor: _theme.colorScheme.primary)),
            Container(
                alignment: Alignment.center,
                child: customText(
                    text: "Abdullh25@gmail.com",
                    fontColor: _theme.colorScheme.primary)),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                innerText: LocaleKeys.signIn.tr,
                onPressed: () {
                  Get.toNamed(RoutesClass.getSignInPageRoute());
                }),
            const SizedBox(
              height: 15,
            ),
            ListTitle(
                title: LocaleKeys.notification.tr,
                imageIcon: Constants.bellIconImage,
                onTap: () =>
                    Get.toNamed(RoutesClass.getNotificationPageRoute())),
            ListTitle(
                title: LocaleKeys.creditCard.tr,
                imageIcon: Constants.paymentIconImage,
                onTap: () => Get.toNamed(RoutesClass.getCreditCardPageRoute())),
            ListTitle(
                title: LocaleKeys.myOrders.tr,
                imageIcon: Constants.orderIconImage,
                onTap: () => Get.toNamed(RoutesClass.getOrdersListPageRoute())),
            ListTitle(
                title: LocaleKeys.deliveryLocation.tr,
                imageIcon: Constants.truckIconImage,
                onTap: () =>
                    Get.toNamed(RoutesClass.getDeliveryLocalitionPageRoute())),
            ListTitle(
                title: LocaleKeys.darkMode.tr,
                imageIcon: Constants.darkModeIconImage,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const DarkModPop());
                }),
            ListTitle(
                title: LocaleKeys.appLanguage.tr,
                imageIcon: Constants.globalIconImage,
                onTap: () => Get.toNamed(RoutesClass.getSetLangPageRoute())),
            ListTitle(
                title: LocaleKeys.termsAndConditions.tr,
                imageIcon: Constants.noteIconImage,
                onTap: () {}),
            ListTitle(
                title: LocaleKeys.shareTheApp.tr,
                imageIcon: Constants.shareIconImage,
                onTap: () {}),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
