class PersonalData {
  final bool success;
  final String message;
  final PersonalInfo? personalInfo;

  PersonalData({
    required this.success,
    required this.message,
    this.personalInfo,
  });

  factory PersonalData.fromJson(Map<String, dynamic> json) {
    return PersonalData(
      success: json['success'] as bool,
      message: json['message'] as String,
      personalInfo: PersonalInfo.fromJson(json?['personal_info']) as PersonalInfo ?,

          // != null
          // ? PersonalInfo.fromJson(json['personal_info'])
          // : null,
    );
  }
}

class PersonalInfo {
  final String? pDetailsId;
  final String? userId;
  final String? fatherName;
  final String? motherName;
  final String? dateOfBirth;
  final String? religion;
  final String? gender;
  final String? maritalStatus;
  final String? nationality;
  final String? nid;
  final String? passportNo;
  final String? passportIssueDate;
  final String? bloodGroup;

  PersonalInfo({
    this.pDetailsId,
    this.userId,
    this.fatherName,
    this.motherName,
    this.dateOfBirth,
    this.religion,
    this.gender,
    this.maritalStatus,
    this.nationality,
    this.nid,
    this.passportNo,
    this.passportIssueDate,
    this.bloodGroup,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      pDetailsId: json['P_Details_Id'] as String?,
      userId: json['user_id'] as String?,
      fatherName: json['father_name'] as String?,
      motherName: json['mother_name'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      religion: json['religion'] as String?,
      gender: json['gender'] as String?,
      maritalStatus: json['marital_status'] as String?,
      nationality: json['nationality'] as String?,
      nid: json['nid'] as String?,
      passportNo: json['passport_no'] as String?,
      passportIssueDate: json['passport_issue_date'] as String?,
      bloodGroup: json['blood_group'] as String?,
    );
  }
}


// class UserResponse {
//   final bool success;
//   final String message;
//   final String? pDetailsId;
//   final String? userId;
//   final String? fatherName;
//   final String? motherName;
//   final DateTime? dateOfBirth;
//   final String? religion;
//   final String? gender;
//   final String? maritalStatus;
//   final String? nationality;
//   final String? nid;
//   final String? passportNo;
//   final DateTime? passportIssueDate;
//   final String? bloodGroup;
//
//   const UserResponse({
//     required this.success,
//     required this.message,
//     this.pDetailsId,
//     this.userId,
//     this.fatherName,
//     this.motherName,
//     this.dateOfBirth,
//     this.religion,
//     this.gender,
//     this.maritalStatus,
//     this.nationality,
//     this.nid,
//     this.passportNo,
//     this.passportIssueDate,
//     this.bloodGroup,
//   });
//
//   factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
//     success: json['success'] as bool,
//     message: json['message'] as String,
//     pDetailsId: json['P_Details_Id'] as String?,
//     userId: json['user_id'] as String?,
//     fatherName: json['father_name'] as String?,
//     motherName: json['mother_name'] as String?,
//     dateOfBirth: json['date_of_birth'] != null
//         ? DateTime.parse(json['date_of_birth'] as String)
//         : null,
//     religion: json['religion'] as String?,
//     gender: json['gender'] as String?,
//     maritalStatus: json['marital_status'] as String?,
//     nationality: json['nationality'] as String?,
//     nid: json['nid'] as String?,
//     passportNo: json['passport_no'] as String?,
//     passportIssueDate: json['passport_issue_date'] != null
//         ? DateTime.parse(json['passport_issue_date'] as String)
//         : null,
//     bloodGroup: json['blood_group'] as String?,
//   );
//
//   Map<String, dynamic> toJson() => {
//     'success': success,
//     'message': message,
//     'P_Details_Id': pDetailsId,
//     'user_id': userId,
//     'father_name': fatherName,
//     'mother_name': motherName,
//     'date_of_birth': dateOfBirth?.toString(),
//     'religion': religion,
//     'gender': gender,
//     'marital_status': maritalStatus,
//     'nationality': nationality,
//     'nid': nid,
//     'passport_no': passportNo,
//     'passport_issue_date': passportIssueDate?.toString(),
//     'blood_group': bloodGroup,
//   };
// }
