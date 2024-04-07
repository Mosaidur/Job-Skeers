class LanguageSkillsData {
  final bool success;
  final String message;
  final List<LanguageSkill>? languageSkills;

  LanguageSkillsData({
    required this.success,
    required this.message,
    this.languageSkills,
  });

  factory LanguageSkillsData.fromJson(Map<String, dynamic> json) {
    List<dynamic>? languageSkillsJson = json['languageSkills'];
    List<LanguageSkill> languageSkills = [];

    if (languageSkillsJson != null) {
      languageSkills = languageSkillsJson.map((skillJson) => LanguageSkill.fromJson(skillJson)).toList();
    }

    return LanguageSkillsData(
      success: json['success'] as bool,
      message: json['message'] as String,
      languageSkills: languageSkills,
    );
  }
}

class LanguageSkill {
  final String? languageId;
  final String? language;
  final String? readingLevel;
  final String? writingLevel;
  final String? speakingLevel;

  LanguageSkill({
    this.languageId,
    this.language,
    this.readingLevel,
    this.writingLevel,
    this.speakingLevel,
  });

  factory LanguageSkill.fromJson(Map<String, dynamic> json) {
    return LanguageSkill(
      languageId: json['Language_Id'] as String?,
      language: json['language'] as String?,
      readingLevel: json['readingLevel'] as String?,
      writingLevel: json['writingLevel'] as String?,
      speakingLevel: json['speakingLevel'] as String?,
    );
  }
}
