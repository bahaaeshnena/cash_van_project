class BaseModel<T> {
  final bool success;
  final String message;
  final T? data;
  final int statusCode;

  BaseModel({
    required this.success,
    required this.message,
    required this.data,
    required this.statusCode,
  });
}
