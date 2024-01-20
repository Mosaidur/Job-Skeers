class LoginResponse {
  final bool success;
  final String message;
  final String? userId;
  final String? userName;
  final String? userEmail;
  final String? userPhoneNo;

  LoginResponse( {
    required this.success,
    required this.message,
     this.userId,
    this.userName,
    this.userEmail,
    this.userPhoneNo,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      userId: json?['user_id'] as String?,
      userName: json?['user_name'] as String?,
      userEmail: json?['user_email'] as String?,
      userPhoneNo: json?['user_phone_no'] as String?,
      success: json['success'] as bool ,
      message: json['message'] as String,

    );
  }
}
