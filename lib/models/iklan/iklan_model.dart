class Iklan {
  Iklan({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<IklanModel>? data;

  factory Iklan.fromJson(Map<String, dynamic> json) => Iklan(
        success: json["success"],
        message: json["message"],
        data: List<IklanModel>.from(
            json["data"].map((x) => IklanModel.fromJson(x))),
      );
}

class IklanModel {
  IklanModel({
    this.id,
    this.name,
    this.originalName,
    this.url,
    this.description,
  });

  String? id;
  String? name;
  String? originalName;
  String? url;
  String? description;

  factory IklanModel.fromJson(Map<String, dynamic> json) => IklanModel(
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        url: json["url"],
        description: json["description"],
      );
}
