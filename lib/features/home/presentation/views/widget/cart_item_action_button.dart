import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hup/features/home/presentation/cubit/cart_item_cubit/cart_item_cubit.dart';

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionBotton(
          icon: Icons.add,
          iconColor: Colors.white,
          color: AppColors.lightPrimaryColor,
          onPressed: () {
            cartItemEntity.inCreaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          cartItemEntity.quantity.toString(),
          style: AppTextStyles.semiBold16,
        ),
        SizedBox(
          width: 16,
        ),
        CartItemActionBotton(
          icon: Icons.remove,
          color: AppColors.gray100,
          onPressed: () {
            cartItemEntity.deCreaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          iconColor: AppColors.gray300,
        ),
      ],
    );
  }
}

class CartItemActionBotton extends StatelessWidget {
  const CartItemActionBotton(
      {super.key,
      required this.icon,
      required this.color,
      required this.onPressed,
      required this.iconColor});
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(2),
        width: 24,
        height: 24,
        child: Container(
          width: 24,
          height: 24,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: FittedBox(
            child: Icon(
              color: iconColor,
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
