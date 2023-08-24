class DetailSubject {
  bool? status;
  String? message;
  dynamic data;

  DetailSubject({this.status, this.message, this.data});

  DetailSubject.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataSubject.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataSubject {
  String? id;
  String? name;
  int? numberOfSessions;
  String? degree;
  String? level;
  List<String>? lecturer;
  String? basicCompetencies;
  String? indicator;
  String? studyExperience;
  String? teachingMaterials;
  String? toolsNeeded;
  String? scoring;
  String? description;
  String? thumbnail;
  String? thumbnailLink;
  int? credit;

  DataSubject(
      {this.id,
      this.name,
      this.numberOfSessions,
      this.degree,
      this.level,
      this.lecturer,
      this.basicCompetencies,
      this.indicator,
      this.studyExperience,
      this.teachingMaterials,
      this.toolsNeeded,
      this.scoring,
      this.description,
      this.thumbnail,
      this.thumbnailLink,
      this.credit});

  DataSubject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    numberOfSessions = json['number_of_sessions'];
    degree = json['degree'];
    level = json['level'];
    lecturer = json['lecturer'].cast<String>();
    basicCompetencies = json['basic_competencies'];
    indicator = json['indicator'];
    studyExperience = json['study_experience'];
    teachingMaterials = json['teaching_materials'];
    toolsNeeded = json['tools_needed'];
    scoring = json['scoring'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    thumbnailLink = json['thumbnail_link'];
    credit = json['credit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['number_of_sessions'] = numberOfSessions;
    data['degree'] = degree;
    data['level'] = level;
    data['lecturer'] = lecturer;
    data['basic_competencies'] = basicCompetencies;
    data['indicator'] = indicator;
    data['study_experience'] = studyExperience;
    data['teaching_materials'] = teachingMaterials;
    data['tools_needed'] = toolsNeeded;
    data['scoring'] = scoring;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['thumbnail_link'] = thumbnailLink;
    data['credit'] = credit;
    return data;
  }
}
