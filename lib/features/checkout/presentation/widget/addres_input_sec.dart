import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/widget/custom_text_form_field.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';

class AddresInputSec extends StatelessWidget {
  const AddresInputSec(
      {super.key, required this.formKey, required this.valueListenable});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.name =
                      value!;
                },
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.email =
                      value!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.address =
                      value!;
                },
                hintText: 'العنوان',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.city =
                      value!;
                },
                hintText: 'المدينه',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.floor =
                      value!;
                },
                hintText: 'رقم الطابق , رقم الشقه ..',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.phone =
                      value!;
                },
                hintText: 'رقم الهاتف',
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
