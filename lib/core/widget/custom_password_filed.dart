import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widget/custom_text_form_field.dart';

class PasswordFiled extends StatefulWidget {
  const PasswordFiled({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordFiled> createState() => _PasswordFiledState();
}

class _PasswordFiledState extends State<PasswordFiled> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              )
            : Icon(
                Icons.visibility_off,
                color: Color(0xffC9CECF),
              ),
      ),
    );
  }
}
