import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/t_keys.g.dart';
import '../../widget/share_compont/custom_appbare.dart';
import 'widget/notification_card.dart';

class NotificationController extends GetxController {
  var notifications = [
    {
      "title": LocaleKeys.appName.tr,
      "description": "notification description "
    },
    {
      "title": LocaleKeys.appName.tr,
      "description": "notification description "
    },
    {
      "title": LocaleKeys.appName.tr,
      "description": "notification description "
    },
    {
      "title": LocaleKeys.appName.tr,
      "description": "notification description "
    },
    {
      "title": LocaleKeys.appName.tr,
      "description": "notification description "
    },
    // إضافة المزيد من الإشعارات هنا
  ].obs;
}

// ignore: must_be_immutable
class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});
  final NotificationController controller = Get.put(NotificationController());

  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      appBar: customAppBar(
        LocaleKeys.notification.tr,
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
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: _theme.colorScheme.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return ListView.builder(
            itemCount: controller.notifications.length,
            itemBuilder: (BuildContext context, int index) {
              final notification = controller.notifications[index];
              return NotificationCard(
                title: notification['title']!,
                description: notification['description']!,
              );
            },
          );
        }),
      ),
    );
  }
}
