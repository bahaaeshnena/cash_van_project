import 'package:cach_van/core/network/model/base_model.dart';
import 'package:cach_van/features/auth/data/models/user_model.dart';

class UserEntity extends BaseModel<UserModel> {
  UserEntity({
    required super.success,
    required super.message,
    required super.data,
    required super.statusCode,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      success: json['success'] as bool,
      message: json['message'] as String,
      statusCode: json['statusCode'] as int,
      data: json['data'] != null ? UserModel.fromJson(json['data'] as Map<String, dynamic>) : null,
    );
  }

  @override
  String toString() {
    return 'UserEntity{success: $success, message: $message, statusCode: $statusCode, data: $data}';
  }
}
