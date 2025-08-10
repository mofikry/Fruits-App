import 'package:flutter/material.dart';
import 'package:fruit_hup/core/helper_function/get_user.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/core/widget/custom_notification_icon.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesMaskgroup),
      trailing: NotificationIcons(),
      title: Text('صباح الخير !..',
          style: AppTextStyles.regular16.copyWith(color: AppColors.gray300)),
      subtitle: Text(
        getUser().name,
        style: AppTextStyles.semiBold16.copyWith(color: Colors.black),
      ),
    );
  }
}
