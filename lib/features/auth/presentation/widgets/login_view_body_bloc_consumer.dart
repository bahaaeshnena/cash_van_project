import 'package:cach_van/core/common/widgets/custom_modal_progress_hud.dart';
import 'package:cach_van/core/common/widgets/custom_snack_bar.dart';
import 'package:cach_van/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cach_van/features/auth/presentation/widgets/login_view_body.dart';
import 'package:cach_van/features/home/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          CustomSnackBar.show(
            context,
            message: state.user.message,
            isError: !state.user.success,
          );
          if (state.user.success) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeView.routeName,
              (route) => false,
            );
          }
        }
        if (state is AuthFailure) {
          CustomSnackBar.show(
            context,
            message: state.errorMessage,
            isError: true,
          );
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          isLoading: state is AuthLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
