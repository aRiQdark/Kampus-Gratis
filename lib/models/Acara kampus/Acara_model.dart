class AcaraModel {
  AcaraModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  dynamic data;

  factory AcaraModel.fromJson(Map<String, dynamic> json) => AcaraModel(
        status: json["status"],
        message: json["message"],
        data: DataAcara.fromJson(json["data"]),
      );
}

class DataAcara {
  DataAcara({
    this.totalData,
    this.maxPage,
    this.result,
  });

  int? totalData;
  int? maxPage;
  List<Result>? result;

  factory DataAcara.fromJson(Map<String, dynamic> json) => DataAcara(
        totalData: json["total_data"],
        maxPage: json["max_page"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    this.dateStart,
    this.name,
    this.thumbnail,
    this.price,
    this.id,
  });

  DateTime? dateStart;
  String? name;
  String? thumbnail;
  int? price;
  String? id;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        dateStart: DateTime.parse(json["date_start"]),
        name: json["name"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        id: json["id"],
      );
}
