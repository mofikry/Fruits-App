import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(
          left: 12,
        ),
        decoration: ShapeDecoration(
          color: Color(0xffEEEEEE),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(30))),
              child: Center(child: SvgPicture.asset(image)),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              text,
              style: AppTextStyles.semiBold11
                  .copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
