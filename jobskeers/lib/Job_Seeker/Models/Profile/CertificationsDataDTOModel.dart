class CertificationsData {
  final bool success;
  final String message;
  final List<Certification>? certifications;

  CertificationsData({
    required this.success,
    required this.message,
    this.certifications,
  });

  factory CertificationsData.fromJson(Map<String, dynamic> json) {
    List<dynamic>? certificationsJson = json['certifications'];
    List<Certification> certifications = [];

    if (certificationsJson != null) {
      certifications = certificationsJson.map((certJson) => Certification.fromJson(certJson)).toList();
    }

    return CertificationsData(
      success: json['success'] as bool,
      message: json['message'] as String,
      certifications: certifications,
    );
  }
}

class Certification {
  final String? certificationId;
  final String? certificationTitle;
  final String? instituteName;
  final String? location;
  final String? startDate;
  final String? endDate;

  Certification({
    this.certificationId,
    this.certificationTitle,
    this.instituteName,
    this.location,
    this.startDate,
    this.endDate,
  });

  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      certificationId: json['Certification_Id'] as String?,
      certificationTitle: json['certificationTitle'] as String?,
      instituteName: json['instituteName'] as String?,
      location: json['location'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );
  }
}
