import "package:dream_store_app/utilities/app_data.dart";
import "package:dream_store_app/models/location_modle.dart";
import "package:dream_store_app/routers/routers.dart";
import "package:dream_store_app/view/widget/share_compont/custom_button.dart";
import "package:dream_store_app/view/widget/share_compont/custom_text.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../controller/prodect_controller.dart";
import "../../../utilities/constants.dart";
import "../../../utilities/t_keys.g.dart";
import "../../widget/share_compont/custom_appbare.dart";
import "../../widget/share_compont/custom_input_field.dart";

// ignore: must_be_immutable
class DeliveryLocationPage extends StatelessWidget {
  DeliveryLocationPage({super.key});
  late Size size;
  late ThemeData _theme;
  late bool isOrientation;
  late TextEditingController locationNameController = TextEditingController();
  late TextEditingController countriesController = TextEditingController();
  late TextEditingController cityController = TextEditingController();
  late TextEditingController stateController = TextEditingController();
  late final ProdectController _prodectController = Get.find();
  @override
  Widget build(BuildContext context) {
    isOrientation = MediaQuery.of(context).orientation == Orientation.landscape;
    _theme = Theme.of(context);
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _theme.colorScheme.background,
      appBar: customAppBar(
        LocaleKeys.deliveryLocation.tr,
        context,
        backgroundColor: _theme.colorScheme.background,
        fontColor: _theme.colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: _theme.colorScheme.primary,
          ),
        ),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: !isOrientation ? size.height : size.width,
        height: !isOrientation ? size.height - 100 : size.width - 70,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: customText(
                    text: LocaleKeys.whereAreYourOrderedItemsShipped.tr,
                    fontColor: _theme.colorScheme.primary,
                    fontSize: 30,
                    textAlign: TextAlign.start),
              ),
              Column(
                children: [
                  CustomInputField(
                    labelText: " ",
                    hintText: LocaleKeys.locationName.tr,
                    controller: locationNameController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    labelText: " ",
                    hintText: LocaleKeys.countries.tr,
                    controller: countriesController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomInputField(
                    labelText: " ",
                    hintText: LocaleKeys.city.tr,
                    controller: cityController,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Column(
                      children: [
                        ListTile(
                            onTap: () {
                              Get.toNamed(RoutesClass.getMapPageRoute());
                            },
                            trailing: const Icon(
                              Icons.location_on,
                              color: Constants.kGranTextColor,
                              size: 30,
                            ),
                            title: _prodectController.mapLocation == ""
                                ? customText(
                                    text: "Location by Google Mep",
                                    fontColor: Constants.kGranTextColor,
                                    textAlign: TextAlign.start)
                                : customText(
                                    text: _prodectController.mapLocation,
                                    fontColor: _theme.colorScheme.primary)),
                        line(marginX: 15)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomButton(
                    innerText: LocaleKeys.okey.tr,
                    onPressed: () {
                      if (locationNameController.text != "" &&
                          countriesController.text != "" &&
                          cityController.text != "" &&
                          _prodectController.mapLocation != "") {
                        Get.back();
                        locations.add(LocationModle(
                            id: locations.length,
                            locationName: locationNameController.text,
                            countries: countriesController.text,
                            city: cityController.text,
                            location: _prodectController.mapLocation));
                        _prodectController.selectMaplocation("");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(seconds: 3),
                          content: customText(
                              text: LocaleKeys.interAllinformationplease.tr,
                              fontColor: _theme.colorScheme.primary,
                              textAlign: TextAlign.start),
                          backgroundColor: _theme.colorScheme.background,
                        ));
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
