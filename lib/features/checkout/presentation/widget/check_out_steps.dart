import 'package:flutter/material.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/step_item.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});

  final int currentPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          getSteps().length,
          (index) => Expanded(
                  child: GestureDetector(
                onTap: () {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                child: StepItem(
                  index: (index + 1).toString(),
                  isActive: index <= currentPageIndex,
                  text: getSteps()[index],
                ),
              ))),
    );
  }
}

List<String> getSteps() {
  return [
    "الشحن",
    "العنوان",
    "الدفع",
  ];
}
