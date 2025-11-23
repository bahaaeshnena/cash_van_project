import 'package:cach_van/core/error/failures.dart';
import 'package:cach_van/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> login({required String username, required String password});

  Future saveUserData(UserEntity user);
}
