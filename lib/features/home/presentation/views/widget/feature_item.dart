import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/custom_button_filed_item.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: AspectRatio(
            aspectRatio: 342 / 158,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 20,
                  child: Image.asset(
                    Assets.imagesFeature,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: itemWidth * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: Svg(Assets.imagesFeatureBackground),
                    fit: BoxFit.cover,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 33.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'عروض العيد',
                          style: AppTextStyles.regular13
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Spacer(),
                        Text(
                          'خصم 25%',
                          style: AppTextStyles.bold16
                              .copyWith(color: Colors.black),
                        ),
                        Spacer(),
                        const SizedBox(
                          height: 11,
                        ),
                        CustomButtonFiledItem(onPressed: () {}),
                        SizedBox(
                          height: 29,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
