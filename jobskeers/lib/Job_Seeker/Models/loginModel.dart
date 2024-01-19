class LoginResponse {
  final bool success;
  final String message;
  final String? userId;

  LoginResponse({
    required this.success,
    required this.message,
     this.userId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      userId: json?['user_id'] as String?,
      success: json['success'] as bool ,
      message: json['message'] as String,

    );
  }
}
