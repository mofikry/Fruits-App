import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hup/features/home/presentation/cubit/cart_cubit/cart_cubit_cubit.dart';
import 'package:fruit_hup/features/home/presentation/cubit/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/cart_item_action_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return SizedBox(
          height: 92,
          child: Row(
            children: [
              Container(
                  width: 73,
                  height: 92,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F5F7),
                  ),
                  child: Image.network(
                    cartItemEntity.productEntity.urlImage!,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  )),
              const SizedBox(width: 17),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(cartItemEntity.productEntity.name,
                            style: AppTextStyles.bold13),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              context
                                  .read<CartCubit>()
                                  .deleteCarItem(cartItemEntity);
                            },
                            child: SvgPicture.asset(Assets.imagesTrash))
                      ],
                    ),
                    Text('${cartItemEntity.totalWight()} كم',
                        style: AppTextStyles.regular13.copyWith(
                          color: AppColors.secandaryColor,
                        )),
                    Row(
                      children: [
                        CartItemActionButton(cartItemEntity: cartItemEntity),
                        Spacer(),
                        Text(
                          '${cartItemEntity.totalPrice()} جنيه',
                          style: AppTextStyles.bold16
                              .copyWith(color: AppColors.orange500),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
