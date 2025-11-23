import 'package:cach_van/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final int userId;
  final String userName;
  final String email;
  final String role;
  final int roleId;
  final String token;
  final String refreshToken;
  final String expiresAtUtc;
  final String fullNameAr;
  final String fullNameEn;
  final String? avatarUrl;

  UserModel({
    required this.userId,
    required this.userName,
    required this.email,
    required this.role,
    required this.roleId,
    required this.token,
    required this.refreshToken,
    required this.expiresAtUtc,
    required this.fullNameAr,
    required this.fullNameEn,
    required this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      userName: json['userName'],
      email: json['email'],
      role: json['role'],
      roleId: json['roleId'],
      token: json['token'],
      refreshToken: json['refreshToken'],
      expiresAtUtc: json['expiresAtUtc'],
      fullNameAr: json['fullNameAr'],
      fullNameEn: json['fullNameEn'],
      avatarUrl: json['avatarUrl'],
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    final data = entity.data!;
    return UserModel(
      userId: data.userId,
      userName: data.userName,
      email: data.email,
      role: data.role,
      roleId: data.roleId,
      token: data.token,
      refreshToken: data.refreshToken,
      expiresAtUtc: data.expiresAtUtc,
      fullNameAr: data.fullNameAr,
      fullNameEn: data.fullNameEn,
      avatarUrl: data.avatarUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'role': role,
      'roleId': roleId,
      'token': token,
      'refreshToken': refreshToken,
      'expiresAtUtc': expiresAtUtc,
      'fullNameAr': fullNameAr,
      'fullNameEn': fullNameEn,
      'avatarUrl': avatarUrl,
    };
  }

  factory UserModel.empty() {
    return UserModel(
      userId: 0,
      userName: '',
      email: '',
      role: '',
      roleId: 0,
      token: '',
      refreshToken: '',
      expiresAtUtc: '',
      fullNameAr: '',
      fullNameEn: '',
      avatarUrl: null,
    );
  }
}
