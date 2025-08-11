import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/widget/custom_app_bar_body.dart';
import 'package:fruit_hup/features/home/presentation/cubit/cart_cubit/cart_cubit_cubit.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/cart_header.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/cart_item_list.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/custom_button_cart.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildAppBar(context,
                      title: 'السلة',
                      showBackIcon: true,
                      showNotification: false),
                  const SizedBox(
                    height: 16,
                  ),
                  const CartHeader(),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const Divider(
                      height: 22,
                      color: Color(0xffF1F1F5),
                    ),
            ),
            CartItemList(
              cartItemEntity: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const Divider(
                      height: 22,
                      color: Color(0xffF1F1F5),
                    ),
            ),
          ],
        ),
        Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.sizeOf(context).height * 0.04,
            child: CustomButtonCart())
      ],
    );
  }
}
