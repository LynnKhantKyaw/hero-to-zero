import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.enabled = true,
    this.obscureText = false,
    this.prefix,
    this.suffix,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onTap,
  });

  final TextEditingController controller;

  final String? labelText;
  final String? hintText;

  final bool enabled;
  final bool obscureText;

  final Widget? prefix;
  final Widget? suffix;

  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      onTap: onTap,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: true,
        prefix: prefix,
        suffixIcon: suffix,
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 13),
        hintText: hintText,
        enabled: enabled,
        isDense: true,
        border: const OutlineInputBorder(
            gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(10))),
        errorBorder: const OutlineInputBorder(
            gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: const OutlineInputBorder(
            gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(10))),
        disabledBorder: const OutlineInputBorder(
            gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
