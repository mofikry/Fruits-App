import 'package:flutter/material.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/order_summry_widget.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/shipping_address_sec.dart';

class PaymentSec extends StatelessWidget {
  const PaymentSec({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        OrderSummryWidget(),
        ShippingAddressSec(
          pageController: pageController,
        ),
      ],
    );
  }
}
