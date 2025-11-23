class ApiEndPoints {
  static const String login = "Auth/login";
  static const String refreshToken = "Auth/refresh";
  static const String logout = "Auth/logout";

  static const List<String> authEndpoints = [
    login,
    refreshToken,
    logout,
  ];
}
