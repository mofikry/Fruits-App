import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/domain/entites/botton_nav_bar_entaty.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/active_item.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key, required this.isSelected, required this.bottonNavBarEntaty});
  final bool isSelected;
  final BottonNavBarEntaty bottonNavBarEntaty;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottonNavBarEntaty.activeImage,
            text: bottonNavBarEntaty.name,
          )
        : InActiveItem(image: bottonNavBarEntaty.inActiveImage);
  }
}
