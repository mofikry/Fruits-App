import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/cubit/products_cubit/prodacts_cubit.dart';
import 'package:fruit_hup/core/widget/constatns.dart';
import 'package:fruit_hup/core/widget/custom_app_bar_body.dart';
import 'package:fruit_hup/core/widget/custom_search_text_filed.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/product_grad_view_bloc.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/prodct_header.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProdact();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(context, title: 'المنتجات', showBackIcon: false),
                SizedBox(
                  height: 16,
                ),
                CustomSearchTextFiled(),
                SizedBox(
                  height: 15,
                ),
                ProdctHeader(
                  productlength: context.read<ProductsCubit>().productlength,
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          ProductGradViewBloc(),
        ],
      ),
    );
  }
}
