import 'package:cach_van/core/common/widgets/custom_text_form_field.dart';
import 'package:cach_van/core/common/widgets/password_field.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/core/utils/validations/validators.dart';
import 'package:cach_van/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cach_van/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FormLoginSection extends StatefulWidget {
  const FormLoginSection({
    super.key,
  });

  @override
  State<FormLoginSection> createState() => _FormLoginSectionState();
}

class _FormLoginSectionState extends State<FormLoginSection> {
  late String username, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: S.of(context).username,
              hint: S.of(context).username,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: SvgPicture.asset(
                Assets.assetsImagesIconsUser,
                fit: BoxFit.scaleDown,
              ),
              validator: (value) => Validators.validateEmail(
                value,
                context,
              ),
              onSaved: (value) {
                username = value!;
              },
            ),
            const SizedBox(height: 20),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            SizedBox(height: 50),
            CustomElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<AuthCubit>().login(
                    username: username,
                    password: password,
                  );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              label: S.of(context).login,
            ),
          ],
        ),
      ),
    );
  }
}
