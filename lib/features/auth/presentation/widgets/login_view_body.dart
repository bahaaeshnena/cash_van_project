// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/common/widgets/custom_text_form_field.dart';
import 'package:cach_van/core/common/widgets/password_field.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/core/utils/helpers/device_utility.dart';
import 'package:cach_van/core/utils/helpers/is_arabic.dart';
import 'package:cach_van/core/utils/validations/validators.dart';
import 'package:cach_van/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:cach_van/features/auth/presentation/widgets/header_login.dart';
import 'package:cach_van/features/auth/presentation/widgets/section_description_login.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Center(
                    child: Container(
                      width: DeviceUtility.getScreenWidth(context) * 0.87,
                      height: DeviceUtility.getScreenHeight(context) * 0.82,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 30,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: SectionDescriptionLogin(),
                          ),
                          Expanded(
                            flex: 5,
                            child: Directionality(
                              textDirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    HeaderLogin(),
                                    const SizedBox(height: 40),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 80),
                                      child: Column(
                                        children: [
                                          CustomTextFormField(
                                            label: S.of(context).username,
                                            hint: "Username",
                                            keyboardType: TextInputType.emailAddress,
                                            prefixIcon: SvgPicture.asset(
                                              Assets.assetsImagesIconsUser,
                                              fit: BoxFit.scaleDown,
                                            ),
                                            validator: (value) => Validators.validateEmail(
                                              value,
                                              context,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          const PasswordField(),
                                          SizedBox(height: 50),
                                          CustomElevatedButton(
                                            onPressed: () {},
                                            label: S.of(context).login,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
