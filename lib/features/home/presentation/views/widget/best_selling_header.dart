import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الاكثر مبيعًا',
          style: AppTextStyles.bold16.copyWith(color: Colors.black),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'best_selling_view');
          },
          child: Text(
            'المزيد',
            style: AppTextStyles.semiBold13.copyWith(color: Color(0xff949D9E)),
          ),
        )
      ],
    );
  }
}
