import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/features/auth/presentation/view/signup.dart';

class DonHaveAccount extends StatelessWidget {
  const DonHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: 'ليس لديك حساب؟ ',
          style: AppTextStyles.semiBold16
              .copyWith(color: const Color(0xff949D9E))),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.of(context).pushNamed(Signup.routeName);
            },
          text: 'انشاء حساب',
          style: AppTextStyles.semiBold16
              .copyWith(color: AppColors.lightPrimaryColor)),
    ]));
  }
}
