class UserDTO {
  final bool success;
  final String message;
  final PersonalInfo? personalInfo;

  UserDTO({required this.success, required this.message, this.personalInfo});

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      success: json['success'],
      message: json['message'],
      personalInfo: json['personal_info'] != null
          ? PersonalInfo.fromJson(json['personal_info'])
          : null,
    );
  }
}

class PersonalInfo {
  final int pDetailsId;
  final String userId;
  final String fatherName;
  final String motherName;
  final String dateOfBirth;
  final String religion;
  final String gender;
  final String maritalStatus;
  final String nationality;
  final String nid;
  final String passportNo;
  final String passportIssueDate;
  final String bloodGroup;

  PersonalInfo({
    required this.pDetailsId,
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

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      pDetailsId: json['P_Details_Id'],
      userId: json['user_id'],
      fatherName: json['father_name'],
      motherName: json['mother_name'],
      dateOfBirth: json['date_of_birth'],
      religion: json['religion'],
      gender: json['gender'],
      maritalStatus: json['marital_status'],
      nationality: json['nationality'],
      nid: json['nid'],
      passportNo: json['passport_no'],
      passportIssueDate: json['passport_issue_date'],
      bloodGroup: json['blood_group'],
    );
  }
}
