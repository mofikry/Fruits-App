import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/cubit/products_cubit/prodacts_cubit.dart';
import 'package:fruit_hup/core/helper_function/get_dummy_product.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/product_grad_view.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/custom_error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductGradViewBloc extends StatelessWidget {
  const ProductGradViewBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProdactsSuccess) {
          return ProductGradView(
            product: state.product,
          );
        } else if (state is ProdactFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(message: state.message));
        } else {
          return Skeletonizer.sliver(
              enabled: true,
              child: ProductGradView(
                product: getDummyProducts(),
              ));
        }
      },
    );
  }
}
