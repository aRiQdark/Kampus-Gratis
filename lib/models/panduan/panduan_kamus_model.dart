class ResponseResultPanduanKamus {
  ResponseResultPanduanKamus({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  dynamic data;

  factory ResponseResultPanduanKamus.fromJson(Map<String, dynamic> json) =>
      ResponseResultPanduanKamus(
        status: json["status"],
        message: json["message"],
        data: List<PanduanKamusModel>.from(
            json["data"].map((x) => PanduanKamusModel.fromJson(x))),
      );
}

class PanduanKamusModel {
  PanduanKamusModel({
    this.id,
    this.word,
    this.definition,
  });

  String? id;
  String? word;
  String? definition;

  factory PanduanKamusModel.fromJson(Map<String, dynamic> json) =>
      PanduanKamusModel(
        id: json["id"],
        word: json["word"],
        definition: json["definition"],
      );
}
