class ResponseResultKalender {
  ResponseResultKalender({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  dynamic data;

  factory ResponseResultKalender.fromJson(Map<String, dynamic> json) =>
      ResponseResultKalender(
        status: json["status"],
        message: json["message"],
        data: List<KalenderModel>.from(
            json["data"].map((x) => KalenderModel.fromJson(x))),
      );
}

class KalenderModel {
  KalenderModel({
    required this.date,
    required this.name,
    required this.category,
  });

  DateTime date;
  String name;
  String category;

  factory KalenderModel.fromJson(Map<String, dynamic> json) => KalenderModel(
        date: DateTime.parse(json["date"]),
        name: json["name"],
        category: json["category"],
      );
}
