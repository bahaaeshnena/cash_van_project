// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/common/helpers/device_utility.dart';
import 'package:cach_van/core/common/helpers/is_arabic.dart';
import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/features/auth/presentation/widgets/form_login_section.dart';
import 'package:cach_van/features/auth/presentation/widgets/header_login.dart';
import 'package:cach_van/features/auth/presentation/widgets/section_description_login.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
                    color: isDarkFun(context)
                        ? const Color(0xFF000000).withOpacity(0.70)
                        : Colors.white,

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
                                FormLoginSection(),
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
    );
  }
}
