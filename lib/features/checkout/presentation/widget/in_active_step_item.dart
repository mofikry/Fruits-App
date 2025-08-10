import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});
  final String text;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(
        radius: 10,
        backgroundColor: AppColors.gray100,
        child: Text(
          index,
          style: AppTextStyles.semiBold13.copyWith(color: Colors.black),
        ),
      ),
      SizedBox(
        width: 4,
      ),
      Text(
        text,
        style: AppTextStyles.semiBold13.copyWith(color: AppColors.gray300),
      )
    ]);
  }
}
