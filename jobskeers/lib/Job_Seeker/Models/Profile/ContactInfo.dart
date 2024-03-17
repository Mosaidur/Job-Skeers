class ContactInfoData {
  final bool success;
  final String message;
  final ContactInfo? contactInfo;

  ContactInfoData({
    required this.success,
    required this.message,
    this.contactInfo,
  });

  factory ContactInfoData.fromJson(Map<String, dynamic> json) {
    return ContactInfoData(
      success: json['success'] as bool,
      message: json['message'] as String,
      contactInfo: ContactInfo.fromJson(json['contact_info']) as ContactInfo ?,

      // json['contact_info'] != null
      //     ? ContactInfo.fromJson(json['contact_info'])
      //     : null,
    );
  }
}

class ContactInfo {
  final String? contactId;
  final String? userId;
  final String? presentAddress;
  final String? permanentAddress;
  final String? secondaryPhoneNo;
  final String? emergencyPhoneNo;
  final String? secondaryEmail;

  ContactInfo({
    this.contactId,
    this.userId,
    this.presentAddress,
    this.permanentAddress,
    this.secondaryPhoneNo,
    this.emergencyPhoneNo,
    this.secondaryEmail,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      contactId: json['contact_id'] as String?,
      userId: json['user_id'] as String?,
      presentAddress: json['present_address'] as String?,
      permanentAddress: json['permanent_address'] as String?,
      secondaryPhoneNo: json['secondary_phone_no'] as String?,
      emergencyPhoneNo: json['emergency_phone_no'] as String?,
      secondaryEmail: json['secondary_email'] as String?,
    );
  }
}
