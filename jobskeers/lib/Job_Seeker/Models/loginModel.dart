class LoginResponse {
  final bool success;
  final String message;
  final String? userId;

  LoginResponse({
    required this.success,
    required this.message,
    required this.userId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      userId: json?['userId'] as String?,
    );
  }
}
