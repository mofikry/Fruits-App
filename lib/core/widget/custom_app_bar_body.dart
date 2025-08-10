import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/core/widget/custom_notification_icon.dart';

AppBar buildAppBar(conatext,
    {required String title,
    bool showBackIcon = true,
    bool showNotification = true}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: Visibility(
      visible: showBackIcon,
      child: GestureDetector(
          onTap: () => Navigator.pop(conatext),
          child: const Icon(Icons.arrow_back_ios_new)),
    ),
    actions: [
      Visibility(
        visible: showNotification,
        child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: NotificationIcons(),
            )),
      )
    ],
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppTextStyles.bold19.copyWith(color: Colors.black),
    ),
  );
}
