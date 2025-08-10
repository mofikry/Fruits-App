import 'package:flutter/material.dart';
import 'package:fruit_hup/core/services/get_it.dart';
import 'package:fruit_hup/core/widget/custom_app_bar_signin_out.dart';
import 'package:fruit_hup/features/auth/domain/repo/auth_repo.dart';
import 'package:fruit_hup/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/features/auth/presentation/view/widget/singup_view_bloc_consumor.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBarSign(title: 'حساب جديد', context),
        body: SinUpViewBlocConsumer(),
      ),
    );
  }
}
