import 'package:dream_store_app/utilities/app_data.dart';
import 'package:dream_store_app/models/message_ai_modle.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_appbare.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/t_keys.g.dart';
import 'widget/introduction_colum.dart';
import 'widget/messageing_colum.dart';

class AskAIPage extends StatefulWidget {
  const AskAIPage({super.key});

  @override
  State<AskAIPage> createState() => _AskAIPageState();
}

class _AskAIPageState extends State<AskAIPage> {
  late ThemeData _theme;
  late bool isSend = false;
  late String inputmessage = "";
  late TextEditingController messageController = TextEditingController();
  late final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.colorScheme.background,
      appBar: customAppBar(
        LocaleKeys.askStoreAI.tr,
        context,
        backgroundColor: _theme.colorScheme.background,
        fontColor: _theme.colorScheme.primary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: _theme.colorScheme.primary,
            size: 30,
          ),
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: SingleChildScrollView(
              controller: scrollController,
              child: isSend
                  ? MessageingColum(theme: _theme)
                  : IntroductionColum(theme: _theme),
            )),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Constants.kSecondaryColor,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      style: TextStyle(color: _theme.colorScheme.primary),
                      onChanged: (value) {
                        inputmessage = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: LocaleKeys.writeYourMessageHere.tr,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // if (inputmessage != "") {
                      setState(() {
                        isSend = true;
                        messageController.text = "";
                        messages.add(MessageAI(
                            id: messages.length,
                            isAi: false,
                            text: inputmessage,
                            prodects: []));
                        scrollController.animateTo(1000000000,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.linear);
                      });
                      // }
                    },
                    child: Text(
                      LocaleKeys.send.tr,
                      style: const TextStyle(
                        color: Constants.kSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
