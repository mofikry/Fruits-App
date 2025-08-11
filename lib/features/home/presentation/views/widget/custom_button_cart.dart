import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper_function/build_error_bar.dart';
import 'package:fruit_hup/core/widget/custom_button.dart';
import 'package:fruit_hup/features/checkout/presentation/checkout_view.dart';
import 'package:fruit_hup/features/home/presentation/cubit/cart_cubit/cart_cubit_cubit.dart';
import 'package:fruit_hup/features/home/presentation/cubit/cart_item_cubit/cart_item_cubit.dart';

class CustomButtonCart extends StatelessWidget {
  const CustomButtonCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
            oppressed: () {
              if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
                Navigator.pushNamed(context, CheckoutView.routeName,
                    arguments: context.read<CartCubit>().cartEntity);
              } else {
                buildCustomSnackBar(
                  context,
                  title: 'خطأ ❌',
                  message: 'لا يوجد منتجات في السلة',
                  contentType: ContentType.failure,
                );
              }
            },
            text:
                'الدفع  ${context.watch<CartCubit>().cartEntity.totalPrice()}جنيه');
      },
    );
  }
}
