import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class HaveAnAcoount extends StatelessWidget {
  const HaveAnAcoount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: 'تمتلك حساب بالفعل؟ ',
          style: AppTextStyles.semiBold16
              .copyWith(color: const Color(0xff949D9E))),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pop(context);
            },
          text: 'تسجيل دخول',
          style: AppTextStyles.semiBold16
              .copyWith(color: AppColors.lightPrimaryColor)),
    ]));
  }
}
