import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widget/custom_text_form_field.dart';

class AddresInputSec extends StatelessWidget {
  const AddresInputSec({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            hintText: 'الاسم كامل',
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'العنوان',
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'المدينه',
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'رقم الهاتف',
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
