import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';

class CustomButtonFiledItem extends StatelessWidget {
  const CustomButtonFiledItem({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: Color(0xffDDDFDF), width: 1),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
          ),
          child: FittedBox(
            child: Text('تسوق الان',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                ).copyWith(color: AppColors.lightPrimaryColor)),
          ),
        ),
      ),
    );
  }
}
