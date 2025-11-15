// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.keyboardType,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.maxLines = 1,
    this.readOnly = false,
    this.paddingHorizontal = 0,
    this.onSaved,
  });

  final String label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final int maxLines;
  final bool readOnly;
  final double paddingHorizontal;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: SizedBox(
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword,
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          textInputAction: textInputAction,
          maxLines: isPassword ? 1 : maxLines,
          readOnly: readOnly,

          style: AppTextStyles.body(context),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            labelText: label,
            hintText: hint ?? label,
            labelStyle: AppTextStyles.label(context).copyWith(
              color: theme.colorScheme.onSurface,
              fontSize: 13,
            ),
            hintStyle: AppTextStyles.label(context).copyWith(),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: InputBorder.none,
            enabled: true,
          ),
        ),
      ),
    );
  }
}
