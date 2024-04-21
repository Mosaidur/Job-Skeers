class JobPostData {
  final bool success;
  final String message;
  final List<JobPost>? jobPosts;

  JobPostData({
    required this.success,
    required this.message,
    this.jobPosts,
  });

  factory JobPostData.fromJson(Map<String, dynamic> json) {
    List<dynamic>? jobPostsJson = json['job_posts'];
    List<JobPost> jobPosts = [];

    if (jobPostsJson != null) {
      jobPosts = jobPostsJson.map((jobJson) => JobPost.fromJson(jobJson)).toList();
    }

    return JobPostData(
      success: json['success'] as bool,
      message: json['message'] as String,
      jobPosts: jobPosts,
    );
  }
}

class JobPost {
  final String jobId;
  final String company_name;
  final String jobTitle;
  final String workplaceType;
  final String jobType;
  final String salary;
  final String jobDescription;
  final String jobResponsibilities;
  final String jobRequirement;
  final String additionalRequirement;
  final String vacancies;
  final String employmentType;
  final String gender;
  final String experience;
  final String benefits;
  final String deadline;
  final String publishStatus;
  final String readBeforeApply;

  JobPost({
    required this.jobId,
    required this.company_name,
    required this.jobTitle,
    required this.workplaceType,
    required this.jobType,
    required this.salary,
    required this.jobDescription,
    required this.jobResponsibilities,
    required this.jobRequirement,
    required this.additionalRequirement,
    required this.vacancies,
    required this.employmentType,
    required this.gender,
    required this.experience,
    required this.benefits,
    required this.deadline,
    required this.publishStatus,
    required this.readBeforeApply,
  });

  factory JobPost.fromJson(Map<String, dynamic> json) {
    return JobPost(
      jobId: json['job_id'] as String,
      company_name: json['company_name']?.toString() ?? '',
      jobTitle: json['job_title'] as String,
      workplaceType: json['workplace_type'] as String,
      jobType: json['job_type'] as String,
      salary: json['salary'] as String,
      jobDescription: json['job_description'] as String,
      jobResponsibilities: json['job_responsibilities'] as String,
      jobRequirement: json['job_requirement'] as String,
      additionalRequirement: json['additional_requirement'] as String,
      vacancies: json['vacancies'] as String,
      employmentType: json['employment_type'] as String,
      gender: json['gender'] as String,
      experience: json['experience'] as String,
      benefits: json['benefits'] as String,
      deadline: json['deadline'] as String,
      publishStatus: json['publish_status'] as String,
      readBeforeApply: json['read_before_apply'] as String,
    );
  }
}
