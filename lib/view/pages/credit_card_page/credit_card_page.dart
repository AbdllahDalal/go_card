import 'package:dream_store_app/view/widget/share_compont/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/t_keys.g.dart';
import '../../widget/share_compont/custom_appbare.dart';
import 'package:flutterme_credit_card/flutterme_credit_card.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  late ThemeData _theme;
  late String number = "";
  late String holder = "";
  late String cvv = "";
  late String validThru = "";
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      appBar: customAppBar(
        LocaleKeys.creditCard.tr,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FMCreditCard(
                color: Constants.kSecondaryColor,
                number: number,
                numberMaskType: FMMaskType.first6last2,
                cvv: cvv,
                cvvMaskType: FMMaskType.full,
                validThru: validThru,
                validThruMaskType: FMMaskType.none,
                holder: holder,
              ),
              const SizedBox(height: 30),
              Form(
                child: Column(
                  children: [
                    FMHolderField(
                      onChanged: (value) {
                        setState(() {
                          holder = value;
                        });
                      },
                      cursorColor: Constants.kSecondaryColor,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Constants.kSecondaryColor,
                          ),
                        ),
                        labelStyle:
                            TextStyle(color: _theme.colorScheme.primary),
                        labelText: "Card Holder",
                        hintText: "John Doe",
                      ),
                    ),
                    const SizedBox(height: 30),
                    FMNumberField(
                      onChanged: (value) {
                        setState(() {
                          number = value;
                        });
                      },
                      cursorColor: Constants.kSecondaryColor,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Constants.kSecondaryColor,
                          ),
                        ),
                        labelStyle:
                            TextStyle(color: _theme.colorScheme.primary),
                        labelText: "Card Number",
                        hintText: "0000 0000 0000 0000",
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: FMValidThruField(
                            onChanged: (value) {
                              setState(() {
                                validThru = value;
                              });
                            },
                            cursorColor: Constants.kSecondaryColor,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Constants.kSecondaryColor,
                                ),
                              ),
                              labelStyle:
                                  TextStyle(color: Constants.kSecondaryColor),
                              labelText: "Expiration Date",
                              hintText: "00/00",
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: FMCvvField(
                            onChanged: (value) {
                              setState(() {
                                cvv = value;
                              });
                            },
                            cursorColor: Constants.kSecondaryColor,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Constants.kSecondaryColor,
                                ),
                              ),
                              labelStyle:
                                  TextStyle(color: _theme.colorScheme.primary),
                              labelText: "CVV",
                              hintText: "***",
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 30),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child:
                    CustomButton(innerText: LocaleKeys.okey, onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
