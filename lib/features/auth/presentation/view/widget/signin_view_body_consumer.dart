import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper_function/build_error_bar.dart';
import 'package:fruit_hup/features/auth/presentation/cubit/signin_cubit/signin_cubit_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/view/widget/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBodyConsumer extends StatelessWidget {
  const SigninViewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushReplacementNamed(context, '/home');
        }
        if (state is SigninError) {
          buildCustomSnackBar(
            context,
            title: 'خطأ ❌',
            message: state.message,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SigninLoading ? true : false,
            child: LoginViewBody());
      },
    );
  }
}
