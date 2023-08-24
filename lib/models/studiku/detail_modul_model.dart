// To parse this JSON data, do
//
//     final detailModuleModel = detailModuleModelFromJson(jsonString);

import 'dart:convert';

DetailModuleModel detailModuleModelFromJson(String str) =>
    DetailModuleModel.fromJson(json.decode(str));

String detailModuleModelToJson(DetailModuleModel data) =>
    json.encode(data.toJson());

class DetailModuleModel {
  DetailModuleModel({
    required this.module,
    required this.videos,
    required this.documents,
  });

  Module module;
  List<Video> videos;
  List<Document> documents;

  factory DetailModuleModel.fromJson(Map<String, dynamic> json) =>
      DetailModuleModel(
        module: Module.fromJson(json["module"]),
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "module": module.toJson(),
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
      };
}

class Document {
  Document({
    required this.id,
    required this.content,
    required this.file,
    required this.link,
    required this.description,
  });

  String id;
  String content;
  String file;
  String link;
  String description;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["id"],
        content: json["content"],
        file: json["file"],
        link: json["link"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "file": file,
        "link": link,
        "description": description,
      };
}

class Module {
  Module({
    required this.id,
    required this.sessionId,
    required this.videoId,
    required this.documentId,
  });

  String id;
  String sessionId;
  List<String> videoId;
  List<String> documentId;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json["id"],
        sessionId: json["session_id"],
        videoId: List<String>.from(json["video_id"].map((x) => x)),
        documentId: List<String>.from(json["document_id"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "session_id": sessionId,
        "video_id": List<dynamic>.from(videoId.map((x) => x)),
        "document_id": List<dynamic>.from(documentId.map((x) => x)),
      };
}

class Video {
  Video({
    required this.id,
    required this.url,
    required this.title,
    required this.description,
  });

  String id;
  String url;
  String title;
  String description;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        url: json["url"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "title": title,
        "description": description,
      };
}
