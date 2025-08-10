import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_decoration.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${title}', style: AppTextStyles.bold13),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: AppDecoration.grayBoxDecoration,
          child: child,
        )
      ],
    );
  }
}
