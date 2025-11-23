import 'dart:convert';

import 'package:cach_van/core/services/shared_prefs.dart';
import 'package:cach_van/core/utils/constants/constants.dart';
import 'package:cach_van/features/auth/data/models/user_model.dart';

UserModel getUser() {
  final jsonString = Prefs.getString(kUserData);
  if (jsonString.isEmpty) {
    return UserModel.empty();
  }
  return UserModel.fromJson(jsonDecode(jsonString));
}

Future<void> updateUserTokens({
  required String token,
  required String refreshToken,
  required String expiresAtUtc,
}) async {
  final current = getUser();

  final updated = UserModel(
    userId: current.userId,
    userName: current.userName,
    email: current.email,
    role: current.role,
    roleId: current.roleId,
    token: token,
    refreshToken: refreshToken,
    expiresAtUtc: expiresAtUtc,
    fullNameAr: current.fullNameAr,
    fullNameEn: current.fullNameEn,
    avatarUrl: current.avatarUrl,
  );

  final jsonData = jsonEncode(updated.toJson());
  await Prefs.setString(kUserData, jsonData);
}
