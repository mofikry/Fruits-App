import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

AppBar buildAppBarSign(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Icon(Icons.arrow_back_ios_new),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppTextStyles.bold19.copyWith(color: Colors.black),
    ),
  );
}
