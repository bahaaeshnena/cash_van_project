import 'package:cach_van/core/services/service_locator.dart';
import 'package:cach_van/features/auth/domain/repo/auth_repo.dart';
import 'package:cach_van/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cach_van/features/auth/presentation/widgets/login_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepo>()),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: LoginViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
