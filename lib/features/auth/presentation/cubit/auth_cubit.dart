import 'package:bloc/bloc.dart';
import 'package:cach_van/features/auth/domain/entities/user_entity.dart';
import 'package:cach_van/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await authRepo.login(username: username, password: password);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) {
        emit(AuthSuccess(user: user));
      },
    );
  }
}
