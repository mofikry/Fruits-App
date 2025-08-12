import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/payment_item.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
        title: 'ملخص الطلب :',
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'المجموع الفرعي :',
                  style: AppTextStyles.regular13
                      .copyWith(color: const Color(0xFF4E5556)),
                ),
                const Spacer(),
                Text(
                    '${context.read<OrderEntity>().cartEntity.totalPrice()} جنيه',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bold16
                        .copyWith(color: const Color(0xFF0C0D0D), fontSize: 16))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  'التوصيل  :',
                  style: AppTextStyles.regular13
                      .copyWith(color: const Color(0xFF4E5556)),
                ),
                const Spacer(),
                Text(
                  '40جنية',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.regular13
                      .copyWith(color: const Color(0xFF4E5556)),
                )
              ],
            ),
            const SizedBox(
              height: 9,
            ),
            const Divider(
              height: 18,
              color: Color(0xFFCACECE),
              thickness: .5,
            ),
            const SizedBox(
              height: 9,
            ),
            Row(
              children: [
                Text(
                  ' الكلي',
                  style: AppTextStyles.bold16.copyWith(
                    color: const Color(0xFF0C0D0D),
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  '${context.read<OrderEntity>().cartEntity.totalPrice() + 40} جنيه',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.bold16.copyWith(
                    color: const Color(0xFF0C0D0D),
                    fontSize: 16,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}
