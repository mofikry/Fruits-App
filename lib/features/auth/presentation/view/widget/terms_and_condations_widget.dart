import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/features/auth/presentation/view/widget/custom_check_box.dart';

class TermsAndCondationsWidget extends StatefulWidget {
  const TermsAndCondationsWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndCondationsWidget> createState() =>
      _TermsAndCondationsWidgetState();
}

class _TermsAndCondationsWidgetState extends State<TermsAndCondationsWidget> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChanged: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: ' من خلال إنشاء حساب ، فإنك توافق على ',
                style: AppTextStyles.semiBold13
                    .copyWith(color: const Color(0xff949D9E))),
            TextSpan(
                text: 'الشروط والأحكام الخاصة بنا',
                style: AppTextStyles.semiBold13
                    .copyWith(color: AppColors.lightPrimaryColor)),
          ])),
        )
      ],
    );
  }
}
