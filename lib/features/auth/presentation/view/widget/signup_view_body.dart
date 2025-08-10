import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/widget/constatns.dart';
import 'package:fruit_hup/core/helper_function/build_error_bar.dart';

import 'package:fruit_hup/core/widget/custom_button.dart';
import 'package:fruit_hup/core/widget/custom_password_filed.dart';
import 'package:fruit_hup/core/widget/custom_text_form_field.dart';
import 'package:fruit_hup/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';

import 'package:fruit_hup/features/auth/presentation/view/widget/have_an_account.dart';
import 'package:fruit_hup/features/auth/presentation/view/widget/terms_and_condations_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String name;
  late String email;
  late String password;

  bool termsAndCondations = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) name = value;
                },
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
                suffixIcon: null,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) email = value;
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
                  if (value != null && value.isNotEmpty) password = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TermsAndCondationsWidget(
                onChanged: (value) {
                  termsAndCondations = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: 'إنشاء حساب جديد',
                oppressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    if (name.isEmpty || email.isEmpty || password.isEmpty) {
                      buildErrorBar(context, 'يرجى ملء جميع الحقول');
                      return;
                    }

                    if (termsAndCondations) {
                      context
                          .read<SignupCubit>()
                          .createUserAndPasaword(email, password, name);
                    } else {
                      buildErrorBar(context, 'يجب قبول الشروط والاحكام');
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 26,
              ),
              HaveAnAcoount()
            ],
          ),
        ),
      ),
    );
  }
}
