class MajorsModel {
  MajorsModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  dynamic data;

  factory MajorsModel.fromJson(Map<String, dynamic> json) => MajorsModel(
        status: json["status"],
        message: json["message"],
        data: FacultyModel.fromJson(json["data"]),
      );
}

class FacultyModel {
  FacultyModel({
    this.id,
    this.name,
    this.majors,
  });

  String? id;
  String? name;
  List<Majors>? majors;

  factory FacultyModel.fromJson(Map<String, dynamic> json) => FacultyModel(
        id: json["id"],
        name: json["name"],
        majors:
            List<Majors>.from(json["Majors"].map((x) => Majors.fromJson(x))),
      );
}

class Majors {
  Majors({
    this.id,
    this.name,
    this.headOfMajor,
    this.thumbnail,
    this.thumbnailLink,
    this.description,
    this.faculty,
  });

  String? id;
  String? name;
  String? headOfMajor;
  String? thumbnail;
  String? thumbnailLink;
  String? description;
  String? faculty;

  factory Majors.fromJson(Map<String, dynamic> json) => Majors(
        id: json["id"],
        name: json["name"],
        headOfMajor: json["head_of_major"],
        thumbnail: json["thumbnail"],
        thumbnailLink: json["thumbnail_link"],
        description: json["description"],
        faculty: json["faculty"],
      );
}
