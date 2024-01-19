class VerificationCodeResponse {
  final bool success;
  final String message;

  VerificationCodeResponse({required this.success, required this.message});

  factory VerificationCodeResponse.fromJson(Map<String, dynamic> json) {
    return VerificationCodeResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}