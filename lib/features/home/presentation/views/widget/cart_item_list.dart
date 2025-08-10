import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItemEntity});
  final List<CartItemEntity> cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList.separated(
        separatorBuilder: (context, index) => const Divider(
          height: 22,
          color: Color(0xffF1F1F5),
        ),
        itemCount: cartItemEntity.length,
        itemBuilder: (context, index) => CartItem(
          cartItemEntity: cartItemEntity[index],
        ),
      ),
    );
  }
}
