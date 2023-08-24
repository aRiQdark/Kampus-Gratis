class ResponseResultPanduanVideo {
  ResponseResultPanduanVideo({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  dynamic data;

  factory ResponseResultPanduanVideo.fromJson(Map<String, dynamic> json) =>
      ResponseResultPanduanVideo(
        status: json["status"],
        message: json["message"],
        data: List<PanduanVideoModel>.from(
            json["data"].map((x) => PanduanVideoModel.fromJson(x))),
      );
}

class PanduanVideoModel {
  PanduanVideoModel({
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

  factory PanduanVideoModel.fromJson(Map<String, dynamic> json) =>
      PanduanVideoModel(
        id: json["id"],
        type: json["type"],
        description: json["description"],
        title: json["title"],
        content: Content.fromJson(json["content"]),
      );
}

class Content {
  Content({
    this.url,
  });

  String? url;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        url: json["url"],
      );
}
