import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/features/on_bording/presentation/view/widget/page_view_item.dart';

class OnBoardaingPageView extends StatelessWidget {
  const OnBoardaingPageView({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
            isVisable: true,
            image: Assets.imagesPageViewItem1Image,
            background: Assets.imagesPageViewItem1BackgroundImage,
            subtitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية',
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مرحبًا بك في',
                  style: AppTextStyles.bold23,
                ),
                Text(
                  '  HUB',
                  style: AppTextStyles.bold23
                      .copyWith(color: AppColors.secandaryColor),
                ),
                Text(
                  'Fruit',
                  style: AppTextStyles.bold23
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            )),
        PageViewItem(
            isVisable: false,
            image: Assets.imagesPageViewItem2Image,
            background: Assets.imagesPageViewItem2BackgroundImage,
            subtitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            title: Text(
              'ابحث وتسوق',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0C0D0D),
                fontSize: 23,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )),
      ],
    );
  }
}
