import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper_function/build_error_bar.dart';
import 'package:fruit_hup/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/view/widget/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SinUpViewBlocConsumer extends StatelessWidget {
  const SinUpViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pop(context);
        }
        if (state is SignupError) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return Builder(builder: (context) {
          return BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return ModalProgressHUD(
                  inAsyncCall: state is SignupLoading ? true : false,
                  child: SignupViewBody());
            },
          );
        });
      },
    );
  }
}
