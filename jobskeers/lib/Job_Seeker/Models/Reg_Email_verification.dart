class EmailVerificationDTO {
  bool success;
  String message;

  EmailVerificationDTO({required this.success, required this.message});

  factory EmailVerificationDTO.fromJson(Map<String, dynamic> json) {
    return EmailVerificationDTO(
      success: json['success'],
      message: json['message'],
    );
  }
}
