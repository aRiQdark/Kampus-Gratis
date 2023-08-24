// To parse this JSON data, do
//
//     final moduleModel = moduleModelFromJson(jsonString);

import 'dart:convert';

ModuleModel moduleModelFromJson(String str) =>
    ModuleModel.fromJson(json.decode(str));

String moduleModelToJson(ModuleModel data) => json.encode(data.toJson());

class ModuleModel {
  ModuleModel({
    required this.id,
    required this.description,
    required this.documentId,
    required this.videoId,
    required this.contentLength,
    required this.status,
  });

  String id;
  String description;
  List<String> documentId;
  List<String> videoId;
  ContentLength contentLength;
  String status;

  factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
        id: json["id"],
        description: json["description"],
        documentId: List<String>.from(json["document_id"].map((x) => x)),
        videoId: List<String>.from(json["video_id"].map((x) => x)),
        contentLength: ContentLength.fromJson(json["content_length"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "document_id": List<dynamic>.from(documentId.map((x) => x)),
        "video_id": List<dynamic>.from(videoId.map((x) => x)),
        "content_length": contentLength.toJson(),
        "status": status,
      };
}

class ContentLength {
  ContentLength({
    required this.numberOfVideo,
    required this.numberOfDocument,
  });

  int numberOfVideo;
  int numberOfDocument;

  factory ContentLength.fromJson(Map<String, dynamic> json) => ContentLength(
        numberOfVideo: json["number_of_video"],
        numberOfDocument: json["number_of_document"],
      );

  Map<String, dynamic> toJson() => {
        "number_of_video": numberOfVideo,
        "number_of_document": numberOfDocument,
      };
}
