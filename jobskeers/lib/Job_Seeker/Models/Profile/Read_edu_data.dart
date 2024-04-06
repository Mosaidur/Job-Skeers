class EduInfoData {
  final bool success;
  final String message;
  final List<EducationHistory>? educationHistory;

  EduInfoData({
    required this.success,
    required this.message,
    this.educationHistory,
  });

  factory EduInfoData.fromJson(Map<String, dynamic> json) {
    List<dynamic>? educationHistoryJson = json['education_history'];
    List<EducationHistory> educationHistory = [];

    if (educationHistoryJson != null) {
      educationHistory = educationHistoryJson.map((eduJson) => EducationHistory.fromJson(eduJson)).toList();
    }

    return EduInfoData(
      success: json['success'] as bool,
      message: json['message'] as String,
      educationHistory: educationHistory,
    );

  }
}

class EducationHistory {
  final String? acQualiId;
  final String? levelOfEdu;
  final String? degreeTitle;
  final String? board;
  final String? groupAndMajor;
  final String? institutionName;
  final String? result;
  final String? gpa;
  final String? passingYear;
  final String? duration;

  EducationHistory({
    this.acQualiId,
    this.levelOfEdu,
    this.degreeTitle,
    this.board,
    this.groupAndMajor,
    this.institutionName,
    this.result,
    this.gpa,
    this.passingYear,
    this.duration,
  });

  factory EducationHistory.fromJson(Map<String, dynamic> json) {
    return EducationHistory(
      acQualiId: json['Ac_Quali_Id'] as String?,
      levelOfEdu: json['levelOfEdu'] as String?,
      degreeTitle: json['degreeTitle'] as String?,
      board: json['board'] as String?,
      groupAndMajor: json['groupandMajor'] as String?,
      institutionName: json['institutionName'] as String?,
      result: json['result'] as String?,
      gpa: json['gpa'] as String?,
      passingYear: json['passingYear'] as String?,
      duration: json['duration'] as String?,
    );
  }
}
