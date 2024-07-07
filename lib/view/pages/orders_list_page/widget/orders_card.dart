import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/order_modle.dart';
import '../../../../routers/routers.dart';
import '../../../../utilities/constants.dart';

// ignore: must_be_immutable
class OrdersCard extends StatelessWidget {
  OrdersCard({
    super.key,
    required this.order,
  });

  final Order order;

  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return InkWell(
      onTap: () {
        Get.toNamed(
          RoutesClass.getOrderDetailsPageRoute(),
          arguments: {
            'totalPrice': order.amount,
            'taxes': 0.0,
            'totalPriceWithTaxes': 0.0,
            "orderProdects": order.prodects,
            "reviewOrder": true,
          },
        );
      },
      child: Card(
        color: _theme.colorScheme.primaryContainer,
        surfaceTintColor: _theme.colorScheme.primaryContainer,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.id,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Constants.kSecondaryColor,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                order.date,
                style: TextStyle(color: _theme.colorScheme.primary),
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Payment Status: ',
                            style:
                                TextStyle(color: _theme.colorScheme.primary)),
                        TextSpan(
                          text: order.paymentStatus,
                          style: TextStyle(
                            color: order.paymentStatus == 'Paid'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$${order.amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Constants.kGoldColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Text(
                'Delivery Status: ${order.deliveryStatus}',
                style: TextStyle(color: _theme.colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
