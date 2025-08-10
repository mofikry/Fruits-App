import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class CustomSearchTextFiled extends StatelessWidget {
  const CustomSearchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0x0A000000),
          spreadRadius: 0,
          blurRadius: 9,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ]),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
              width: 20,
              child: Center(child: SvgPicture.asset(Assets.imagesSearchIcon))),
          suffixIcon: SizedBox(
              width: 20,
              child: Center(child: SvgPicture.asset(Assets.imagesFilter))),
          hintStyle:
              AppTextStyles.bold13.copyWith(color: const Color(0xff949D9E)),
          hintText: 'ابحث عن.......',
          fillColor: Colors.white,
          filled: true,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Colors.white, width: 1));
}
