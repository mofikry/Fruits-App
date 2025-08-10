import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/cubit/products_cubit/prodacts_cubit.dart';
import 'package:fruit_hup/core/widget/constatns.dart';
import 'package:fruit_hup/core/widget/custom_search_text_filed.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/product_grad_view_bloc.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/best_selling_header.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/custom_home_appbar.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/feature_list_item.dart';

class HomeViewBoday extends StatefulWidget {
  const HomeViewBoday({
    super.key,
  });

  @override
  State<HomeViewBoday> createState() => _HomeViewBodayState();
}

class _HomeViewBodayState extends State<HomeViewBoday> {
  void initState() {
    context.read<ProductsCubit>().getBestSelleingProdact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                SizedBox(
                  height: 16,
                ),
                CustomSearchTextFiled(),
                SizedBox(
                  height: 15,
                ),
                FeatureListItem(),
                SizedBox(
                  height: 12,
                ),
                BestSellingHeader(),
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
