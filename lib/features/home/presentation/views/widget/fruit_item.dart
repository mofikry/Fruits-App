import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/entities/prodact_entites.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/features/home/presentation/cubit/cart_cubit/cart_cubit_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: Color(0xffF3F5F7),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.favorite_border))),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: 17,
                ),
                productEntity.urlImage != null
                    ? Flexible(child: Image.network(productEntity.urlImage!))
                    : Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey,
                      ),
                SizedBox(
                  height: 17,
                ),
                ListTile(
                  title: Text(
                    productEntity.name,
                    style:
                        AppTextStyles.semiBold16.copyWith(color: Colors.black),
                  ),
                  subtitle: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: productEntity.price.toString(),
                        style: AppTextStyles.bold13
                            .copyWith(color: AppColors.secandaryColor)),
                    TextSpan(
                        text: '/',
                        style: AppTextStyles.semiBold13
                            .copyWith(color: AppColors.orange300)),
                    TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                        text: 'كيلو',
                        style: AppTextStyles.semiBold13
                            .copyWith(color: AppColors.orange300)),
                  ])),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addProduct(productEntity);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
