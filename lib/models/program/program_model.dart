class Program {
  Program({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<ProgramModel>? data;

  factory Program.fromJson(Map<String, dynamic> json) => Program(
        error: json["error"],
        message: json["message"],
        data: List<ProgramModel>.from(
            json["data"].map((x) => ProgramModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class ProgramModel {
  ProgramModel({
    this.id,
    this.namaProgram,
    this.detail,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? namaProgram;
  String? detail;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        id: json["id"],
        namaProgram: json["nama_program"],
        detail: json["detail"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_program": namaProgram,
        "detail": detail,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
