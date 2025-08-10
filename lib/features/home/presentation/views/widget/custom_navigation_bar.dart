import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/domain/entites/botton_nav_bar_entaty.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/navigation_bar_item.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              offset: Offset(0, -2),
              spreadRadius: 0,
              blurRadius: 25,
            )
          ]),
      child: Row(
          children: getBottonNavBars.asMap().entries.map((e) {
        var index = e.key;
        var entity = e.value;
        return Expanded(
          flex: index == currentIndex ? 3 : 2,
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
              widget.onItemTapped(index);
            },
            child: NavigationBarItem(
              isSelected: index == currentIndex,
              bottonNavBarEntaty: entity,
            ),
          ),
        );
      }).toList()),
    );
  }
}
