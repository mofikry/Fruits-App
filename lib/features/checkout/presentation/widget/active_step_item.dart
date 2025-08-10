import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(
        radius: 11.5,
        backgroundColor: AppColors.primaryColor,
        child: SvgPicture.asset(
          Assets.imagesCheckBox,
        ),
      ),
      SizedBox(
        width: 4,
      ),
      Text(
        text,
        style: AppTextStyles.bold13.copyWith(color: AppColors.primaryColor),
      )
    ]);
  }
}
