class JobSeeker {
  final String name;
  final String phoneNo;
  final String Studentship_Title;
  final String email;
  final String password;

  JobSeeker({
    required this.name,
    required this.phoneNo,
    required this.Studentship_Title,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone_no': phoneNo,
      'Studentship_Title': Studentship_Title,
      'email': email,
      'password': password,
    };
  }
}
class ResponseDataModel {
  final bool success;
  final String message;

  ResponseDataModel({
    required this.success,
    required this.message,
  });

  factory ResponseDataModel.fromJson(Map<String, dynamic> json) {
    return ResponseDataModel(
      success: json['success'],
      message: json['message'],
    );
  }
}
