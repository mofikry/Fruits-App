// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/services/get_it.dart';

import 'package:fruit_hup/core/widget/custom_app_bar_signin_out.dart';
import 'package:fruit_hup/features/auth/domain/repo/auth_repo.dart';
import 'package:fruit_hup/features/auth/presentation/cubit/signin_cubit/signin_cubit_cubit.dart';

import 'package:fruit_hup/features/auth/presentation/view/widget/signin_view_body_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBarSign(title: 'تسجيل الدخول', context),
        body: SigninViewBodyConsumer(),
      ),
    );
  }
}
