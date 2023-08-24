class DetailJob {
  DetailJob({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  DetailJobModel? data;

  factory DetailJob.fromJson(Map<String, dynamic> json) => DetailJob(
        status: json["status"],
        message: json["message"],
        data: DetailJobModel.fromJson(json["data"]),
      );
}

class DetailJobModel {
  DetailJobModel({
    this.id,
    this.companyId,
    this.requirements,
    this.workDays,
    this.workHour,
    this.url,
    this.salary,
    this.deadline,
    this.type,
    this.period,
    this.position,
    this.company,
  });

  String? id;
  String? companyId;
  List<String>? requirements;
  String? workDays;
  String? workHour;
  String? url;
  int? salary;
  DateTime? deadline;
  String? type;
  String? period;
  String? position;
  Company? company;

  factory DetailJobModel.fromJson(Map<String, dynamic> json) => DetailJobModel(
        id: json["id"],
        companyId: json["company_id"],
        requirements: List<String>.from(json["requirements"].map((x) => x)),
        workDays: json["work_days"],
        workHour: json["work_hour"],
        url: json["url"],
        salary: json["salary"],
        deadline: DateTime.parse(json["deadline"]),
        type: json["type"],
        period: json["period"],
        position: json["position"],
        company: Company.fromJson(json["Company"]),
      );
}

class Company {
  Company({
    this.id,
    this.userId,
    this.location,
    this.companyName,
    this.companyLogo,
  });

  String? id;
  String? userId;
  String? location;
  String? companyName;
  String? companyLogo;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        userId: json["user_id"],
        location: json["location"],
        companyName: json["company_name"],
        companyLogo: json["company_logo"],
      );
}
