import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widget/custom_button.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/check_out_steps.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/check_out_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckOutSteps(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckOutStepsPageView(pageController: pageController),
          ),
          CustomButton(
              oppressed: () {
                pageController.animateToPage(
                  currentPageIndex + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
              text: getNextCurrentIndex(currentPageIndex)),
          SizedBox(
            height: 34,
          )
        ],
      ),
    );
  }

  String getNextCurrentIndex(int index) {
    switch (index) {
      case 0:
        return 'التالى';
      case 1:
        return 'التالى';
      case 2:
        return 'الدفع بواسطة PayPal';
      default:
        return 'Next';
    }
  }
}
