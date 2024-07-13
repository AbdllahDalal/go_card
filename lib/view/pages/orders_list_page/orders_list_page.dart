import 'package:dream_store_app/utilities/app_data.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_appbare.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../models/order_modle.dart';
import 'widget/orders_card.dart';

class OrdersListPage extends StatefulWidget {
  const OrdersListPage({super.key});

  @override
  State<OrdersListPage> createState() => _OrdersListPageState();
}

class _OrdersListPageState extends State<OrdersListPage> {
  late String paymentStatus = 'All Payments';
  late String deliveryStatus = 'All Delivery';
  late List<Order> fliterOrder = orders;
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      appBar: customAppBar(
        'All Orders',
        context,
        backgroundColor: _theme.colorScheme.background,
        fontColor: _theme.colorScheme.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: _theme.colorScheme.primary,
          ),
          onPressed: () {
            // Action for back button
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: _theme.colorScheme.primary,
            ),
            onPressed: () {
              // Action for search button
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  style: TextStyle(color: _theme.colorScheme.primary),
                  value: paymentStatus,
                  items: paymentStatusList.map((String element) {
                    return DropdownMenuItem<String>(
                      value: element,
                      child: Text(
                        element,
                        style: TextStyle(color: _theme.colorScheme.primary),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      paymentStatus = value!;
                      fliterOrder = orders;
                      fliterOrder = fliterOrder
                          .where((element) =>
                              (element.deliveryStatus == deliveryStatus ||
                                  deliveryStatus == 'All Delivery') &&
                              (element.paymentStatus == paymentStatus ||
                                  paymentStatus == 'All Payments'))
                          .toList();
                    });
                  },
                ),
                DropdownButton<String>(
                  style: TextStyle(color: _theme.colorScheme.primary),
                  value: deliveryStatus,
                  items: deliveryStatusList
                      .map<DropdownMenuItem<String>>((String element) {
                    return DropdownMenuItem<String>(
                      value: element,
                      child: Text(
                        element,
                        style: TextStyle(color: _theme.colorScheme.primary),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      deliveryStatus = value!;
                      fliterOrder = orders;

                      fliterOrder = fliterOrder
                          .where((element) =>
                              (element.deliveryStatus == deliveryStatus ||
                                  deliveryStatus == 'All Delivery') &&
                              (element.paymentStatus == paymentStatus ||
                                  paymentStatus == 'All Payments'))
                          .toList();
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: fliterOrder.length,
                itemBuilder: (context, index) {
                  return OrdersCard(
                      order: fliterOrder.reversed.toList()[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
