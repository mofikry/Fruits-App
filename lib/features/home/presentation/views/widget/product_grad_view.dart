import 'package:flutter/material.dart';
import 'package:fruit_hup/core/entities/prodact_entites.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/fruit_item.dart';

class ProductGradView extends StatelessWidget {
  const ProductGradView({super.key, required this.product});
  final List<ProductEntity> product;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: product.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16),
      itemBuilder: (context, index) => FruitItem(
        productEntity: product[index],
      ),
    );
  }
}
