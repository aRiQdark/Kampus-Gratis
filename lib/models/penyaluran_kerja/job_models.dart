class Job {
  Job({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<JobModels>? data;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        status: json["status"],
        message: json["message"],
        data: List<JobModels>.from(
            json["data"].map((x) => JobModels.fromJson(x))),
      );
}

class JobModels {
  JobModels({
    this.position,
    this.salary,
    this.id,
    this.company,
  });

  String? position;
  int? salary;
  String? id;
  Company? company;

  factory JobModels.fromJson(Map<String, dynamic> json) => JobModels(
        position: json["position"],
        salary: json["salary"],
        id: json["id"],
        company: Company.fromJson(json["Company"]),
      );
}

class Company {
  Company({
    this.companyName,
    this.location,
    this.companyLogo,
  });

  String? companyName;
  String? location;
  String? companyLogo;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyName: json["company_name"],
        location: json["location"],
        companyLogo: json["company_logo"],
      );
}
