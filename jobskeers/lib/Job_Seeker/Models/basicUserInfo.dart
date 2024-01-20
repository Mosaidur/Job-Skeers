// jobseeker_dto.dart

class JobSeekerDTO {
  final bool success;
  final String? userName;
  final String? userEmail;
  final String? userPhoneNo;
  final String message;

  JobSeekerDTO({
    required this.success,
    this.userName,
    this.userEmail,
    this.userPhoneNo,
    required this.message,
  });

  factory JobSeekerDTO.fromJson(Map<String, dynamic> json) {
    return JobSeekerDTO(
      success: json['success'] as bool,
      userName: json?['user_name'] as String ?,
      userEmail: json?['user_email'] as String ? ,
      userPhoneNo: json?['user_phone_no'] as String ?,
      message: json['message'] as String,
    );
  }
}
