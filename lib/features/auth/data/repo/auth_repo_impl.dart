import 'dart:convert';
import 'package:cach_van/core/error/exceptions.dart';
import 'package:cach_van/core/error/failures.dart';
import 'package:cach_van/core/services/api_service.dart';
import 'package:cach_van/core/services/shared_prefs.dart';
import 'package:cach_van/core/utils/constants/api_end_points.dart';
import 'package:cach_van/core/utils/constants/constants.dart';
import 'package:cach_van/features/auth/data/models/user_model.dart';
import 'package:cach_van/features/auth/domain/entities/user_entity.dart';
import 'package:cach_van/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, UserEntity>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: ApiEndPoints.login,
        data: {
          'email': username,
          'password': password,
        },
      );

      final userEntity = UserEntity.fromJson(response);

      if (!userEntity.success) {
        return Left(ServerFailure(userEntity.message));
      }

      await saveUserData(userEntity);
      await Prefs.setBool(kIsLoggedIn, true);
      return Right(userEntity);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioExeption(e));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error, Please try again later'));
    }
  }

  @override
  Future saveUserData(UserEntity user) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toJson());

    await Prefs.setString(kUserData, jsonData);
  }
}
