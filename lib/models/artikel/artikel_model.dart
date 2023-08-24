class Artikel {
  Artikel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  ArtikelModel? data;

  factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
        status: json["status"],
        message: json["message"],
        data: ArtikelModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ArtikelModel {
  ArtikelModel({
    this.totalData,
    this.maxPage,
    this.result,
  });

  int? totalData;
  int? maxPage;
  List<Result>? result;

  factory ArtikelModel.fromJson(Map<String, dynamic> json) => ArtikelModel(
        totalData: json["total_data"],
        maxPage: json["max_page"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_data": totalData,
        "max_page": maxPage,
        "result": List<dynamic>.from(result?.map((x) => x.toJson()) ?? []),
      };
}

class Result {
  Result({
    this.id,
    this.title,
    this.image,
    this.imageLink,
    this.description,
    this.createdAt,
  });

  String? id;
  String? title;
  String? image;
  String? imageLink;
  String? description;
  DateTime? createdAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageLink: json["image_link"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "image_link": imageLink,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
      };
}
