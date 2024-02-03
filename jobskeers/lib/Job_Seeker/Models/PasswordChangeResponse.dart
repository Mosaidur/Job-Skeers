class PasswordChangeResponse {
  final bool success;
  final String message;

  PasswordChangeResponse({
    required this.success,
    required this.message,
  });

  factory PasswordChangeResponse.fromJson(Map<String, dynamic> json) {
    return PasswordChangeResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}