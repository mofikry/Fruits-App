import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/widget/constatns.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/core/widget/custom_button.dart';
import 'package:fruit_hup/core/widget/custom_password_filed.dart';
import 'package:fruit_hup/core/widget/custom_text_form_field.dart';
import 'package:fruit_hup/features/auth/presentation/cubit/signin_cubit/signin_cubit_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/view/widget/dont_have_account.dart';
import 'package:fruit_hup/features/auth/presentation/view/widget/or_divider.dart';
import 'package:fruit_hup/features/auth/presentation/view/widget/social_login-button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(children: [
            const SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              onSaved: (value) {
                email = value!;
              },
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
              suffixIcon: null,
            ),
            const SizedBox(
              height: 16,
            ),
            PasswordFiled(
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                "نسيت كلمة المرور؟",
                style: AppTextStyles.semiBold13
                    .copyWith(color: AppColors.lightPrimaryColor),
              ),
            ]),
            const SizedBox(
              height: 33,
            ),
            CustomButton(
                oppressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context
                        .read<SigninCubit>()
                        .signInWithEmailAndPassword(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                text: 'تسجيل دخول'),
            const SizedBox(
              height: 33,
            ),
            const DonHaveAccount(),
            const SizedBox(
              height: 37,
            ),
            const OrDivider(),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              title: 'تسجيل دخول بواسطة جوجل',
              assets: Assets.imagesGoogleIcon,
              onPressed: () {
                context.read<SigninCubit>().signInWithGoogle();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
                assets: Assets.imagesFacebookIcon,
                title: 'تسجيل دخول بواسطة فيسبوك',
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                }),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
                assets: Assets.imagesAppleIcon,
                title: 'تسجيل دخول بواسطة ابل',
                onPressed: () {})
          ]),
        ),
      ),
    );
  }
}
