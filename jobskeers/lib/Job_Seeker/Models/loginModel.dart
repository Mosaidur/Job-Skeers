class LoginResponse {
  final bool success;
  final String message;
  final String? userId;
  final String? userName;
  final String? userEmail;
  final String? userPhoneNo;
  final String? Studentship_Title;

  LoginResponse( {
    required this.success,
    required this.message,
     this.userId,
    this.userName,
    this.userEmail,
    this.userPhoneNo,
    this.Studentship_Title,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      userId: json?['user_id'] as String?,
      userName: json?['user_name'] as String?,
      userEmail: json?['user_email'] as String?,
      userPhoneNo: json?['user_phone_no'] as String?,
      Studentship_Title: json?['Studentship_Title'] as String?,
      success: json['success'] as bool ,
      message: json['message'] as String,

    );
  }
}
