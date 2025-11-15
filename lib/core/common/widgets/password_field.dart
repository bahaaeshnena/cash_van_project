import 'package:cach_van/core/common/widgets/custom_text_form_field.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/core/utils/validations/validators.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final dynamic Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (value) => Validators.validatePassword(value, context),
      isPassword: isPassword,
      onSaved: widget.onSaved,
      hint: '********',
      label: S.of(context).password,
      prefixIcon: SvgPicture.asset(
        Assets.assetsImagesIconsPassword,
        fit: BoxFit.scaleDown,
        colorFilter: const ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        ),
      ),
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isPassword = !isPassword;
          });
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: Curves.easeOutBack,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return RotationTransition(
              turns: Tween<double>(begin: 0.8, end: 1.0).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: SvgPicture.asset(
            isPassword ? Assets.assetsImagesIconsEyeClosed : Assets.assetsImagesIconsEye,
            key: ValueKey<bool>(isPassword), // مهم عشان AnimatedSwitcher يفرّق بينهم
            fit: BoxFit.scaleDown,
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
