import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper_function/build_error_bar.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';
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
                  if (context.read<OrderEntity>().payWithCash != null) {
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  } else {
                    buildCustomSnackBar(
                      context,
                      title: 'تحذير ⚠️',
                      message: 'قم باختيار طريقة الدفع اولا',
                      contentType: ContentType.warning,
                    );
                  }
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
