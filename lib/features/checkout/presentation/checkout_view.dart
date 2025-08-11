import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widget/custom_app_bar_body.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/checkout_view_body.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
      body: Provider.value(
          value: OrderEntity(
            cartEntity,
          ),
          child: CheckoutViewBody()),
    );
  }
}
