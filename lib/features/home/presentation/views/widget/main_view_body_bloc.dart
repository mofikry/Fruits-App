import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper_function/build_error_bar.dart';
import 'package:fruit_hup/features/home/presentation/cubit/cart_cubit/cart_cubit_cubit.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/main_view_body.dart';

class MainViewBodyBloc extends StatelessWidget {
  const MainViewBodyBloc({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartItemAdded) {
            buildErrorBar(context, 'تم اضافة المنتج بنجاح');
          }
          if (state is CartItemRemoved) {
            buildErrorBar(context, 'تم حذف المنتج بنجاح');
          }
        },
        child: MainViewBody(
          currentViewIndex: currentViewIndex,
        ));
  }
}
