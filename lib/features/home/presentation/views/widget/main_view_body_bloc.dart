import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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
            buildCustomSnackBar(
              context,
              title: 'نجاح 🎉',
              message: 'تمت العملية بنجاح',
              contentType: ContentType.success,
            );
          }
          if (state is CartItemRemoved) {
            buildCustomSnackBar(
              context,
              message: 'تم حذف المنتج بنجاح',
              title: 'نجاح 🎉',
              contentType: ContentType.success,
            );
          }
        },
        child: MainViewBody(
          currentViewIndex: currentViewIndex,
        ));
  }
}
