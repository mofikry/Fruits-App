import 'package:flutter/material.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/addres_input_sec.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/check_out_steps.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/payment_sec.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/shipping_sec.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getSteps().length,
        itemBuilder: (context, index) => getPages()[index],
      ),
    );
  }

  List<Widget> getPages() {
    return [
      ShippingSec(),
      AddresInputSec(),
      PaymentSec(),
    ];
  }
}
