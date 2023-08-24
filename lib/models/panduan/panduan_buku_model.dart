class ResponseResultPanduanBuku {
  ResponseResultPanduanBuku({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  dynamic data;

  factory ResponseResultPanduanBuku.fromJson(Map<String, dynamic> json) =>
      ResponseResultPanduanBuku(
        status: json["status"],
        message: json["message"],
        data: List<PanduanBukuModel>.from(
            json["data"].map((x) => PanduanBukuModel.fromJson(x))),
      );
}

class PanduanBukuModel {
  PanduanBukuModel({
    this.id,
    this.type,
    this.description,
    this.title,
    this.content,
  });

  String? id;
  String? type;
  String? description;
  String? title;
  Content? content;

  factory PanduanBukuModel.fromJson(Map<String, dynamic> json) =>
      PanduanBukuModel(
        id: json["id"],
        type: json["type"],
        description: json["description"],
        title: json["title"],
        content: Content.fromJson(json["content"]),
      );
}

class Content {
  Content({
    this.imageLink,
    this.text,
  });

  String? imageLink;
  String? text;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        imageLink: json["image_link"],
        text: json["text"],
      );
}
