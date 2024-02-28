import 'dart:async';

class InsertPersonalInfoDTO {
  String? pDetailsId;
  String userId;
  String fatherName;
  String motherName;
  String dateOfBirth;
  String religion;
  String gender;
  String maritalStatus;
  String nationality;
  String nid;
  String passportNo;
  String passportIssueDate;
  String bloodGroup;

  InsertPersonalInfoDTO({
    this.pDetailsId,
    required this.userId,
    required this.fatherName,
    required this.motherName,
    required this.dateOfBirth,
    required this.religion,
    required this.gender,
    required this.maritalStatus,
    required this.nationality,
    required this.nid,
    required this.passportNo,
    required this.passportIssueDate,
    required this.bloodGroup,
  });

  Map<String, dynamic> toJson() {
    return {
      'P_Details_Id': pDetailsId,
      'user_id': userId,
      'father_name': fatherName,
      'mother_name': motherName,
      'date_of_birth': dateOfBirth,
      'religion': religion,
      'gender': gender,
      'marital_status': maritalStatus,
      'nationality': nationality,
      'nid': nid,
      'passport_no': passportNo,
      'passport_issue_date': passportIssueDate,
      'blood_group': bloodGroup,
    };
  }
}



class InsertPersonalResponse {
  final bool success;
  final String message;

  InsertPersonalResponse({required this.success, required this.message});

  factory InsertPersonalResponse.fromJson(Map<String, dynamic> json) {
    return InsertPersonalResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}