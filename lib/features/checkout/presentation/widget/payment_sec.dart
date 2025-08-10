import 'package:flutter/material.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/order_summry_widget.dart';

class PaymentSec extends StatelessWidget {
  const PaymentSec({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [SizedBox(height: 24), OrderSummryWidget()],
    );
  }
}
