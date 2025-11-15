import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class Validators {
  static String? validateEmptyText(String? fieldName, String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).isRequired;
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).emailIsRequired;
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return S.of(context).invalidEmailAddress;
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordIsRequired;
    }

    return null;
  }
}
