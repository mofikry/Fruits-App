import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class ProdctHeader extends StatelessWidget {
  const ProdctHeader({super.key, required this.productlength});
  final int productlength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$productlength نتائج',
          style: AppTextStyles.bold16.copyWith(color: Colors.black),
        ),
        Spacer(),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: ShapeDecoration(
                color: Colors.white.withOpacity(.10000000149011612),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: Color(0x66CACECE), width: 1),
                )),
            child: SvgPicture.asset(Assets.imagesArrowSwapHorizontal))
      ],
    );
  }
}
