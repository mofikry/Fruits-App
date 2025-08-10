import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_images.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
          width: 24,
          height: 24,
          duration: Duration(milliseconds: 100),
          decoration: ShapeDecoration(
            color: isChecked ? AppColors.primaryColor : AppColors.gray300,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                    width: 1.5,
                    color: isChecked
                        ? AppColors.primaryColor
                        : AppColors.gray300)),
          ),
          child: isChecked
              ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SvgPicture.asset(
                    Assets.imagesCheckBox,
                  ),
                )
              : const SizedBox()),
    );
  }
}
