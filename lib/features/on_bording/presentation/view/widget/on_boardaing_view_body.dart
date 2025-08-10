import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widget/constatns.dart';
import 'package:fruit_hup/core/services/shared_preferences.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/widget/custom_button.dart';
import 'package:fruit_hup/features/auth/presentation/view/login_view.dart';
import 'package:fruit_hup/features/on_bording/presentation/view/widget/on_boardaing_page_view.dart';

class OnBoardaingViewBody extends StatefulWidget {
  const OnBoardaingViewBody({super.key});

  @override
  State<OnBoardaingViewBody> createState() => _OnBoardaingViewBodyState();
}

class _OnBoardaingViewBodyState extends State<OnBoardaingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SafeArea(
            child: OnBoardaingPageView(
              pageController: pageController,
            ),
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: currentPage == 0
                  ? AppColors.primaryColor.withOpacity(.5)
                  : AppColors.primaryColor),
        ),
        SizedBox(
          height: 29,
        ),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
                oppressed: () {
                  Prefs.setBool(kIsOnBoardingViewSeen, true);
                  Navigator.of(context)
                      .pushReplacementNamed(LoginView.routeName);
                },
                text: 'ابدأ الان'),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
