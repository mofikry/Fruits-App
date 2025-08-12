import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/payment_item.dart';
import 'package:fruit_hup/features/home/presentation/cubit/cart_cubit/cart_cubit_cubit.dart';

class ShippingAddressSec extends StatelessWidget {
  const ShippingAddressSec({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            color: Color((0xFF4E5556)),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "${context.read<OrderEntity>().shippingAddressEntity}",
            textAlign: TextAlign.right,
            style: AppTextStyles.regular13
                .copyWith(color: const Color(0xFF4E5556)),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
            child: SizedBox(
              child: Row(
                children: [
                  const Icon(
                    Icons.edit,
                    color: const Color(0xFF4E5556),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'تعديل',
                    style: AppTextStyles.semiBold13
                        .copyWith(color: const Color(0xFF4E5556)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
