import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widget/custom_app_bar_body.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const String routeName = 'checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
      body: CheckoutViewBody(),
    );
  }
}
