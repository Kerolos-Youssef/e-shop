import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType? keyboardType;
  bool? isPassword;
  String? Function(String?)? onSubmit;
  String? Function(String?)? onChange;
  void Function()? onTab;
  String? Function(String?)? validate;
  String? label;
  Icon? prefix;
  IconData? suffix;
  void Function()? suffixPressed;
  AutovalidateMode? validationMode;

  CustomTextFormField({
    required this.controller,
    this.keyboardType,
    this.isPassword = false,
    this.onSubmit,
    this.onChange,
    this.onTab,
    this.validate,
    this.label,
    this.prefix,
    this.suffix,
    this.validationMode,
    this.suffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword!,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      onTap: onTab,
      autovalidateMode: validationMode,
      decoration: InputDecoration(
        helperText: '',
        labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
      ),
    );
  }
}
