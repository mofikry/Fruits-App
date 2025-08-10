import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: const Color(0xffDDDFDF),
            thickness: 1,
          ),
        ),
        SizedBox(
          width: 17,
        ),
        Text(
          'أو',
          style: AppTextStyles.semiBold16.copyWith(color: Colors.black),
        ),
        SizedBox(
          width: 17,
        ),
        Expanded(
          child: Divider(
            color: const Color(0xffDDDFDF),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
