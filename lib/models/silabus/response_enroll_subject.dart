class ResponseEnrollSubject {
  ResponseEnrollSubject({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory ResponseEnrollSubject.fromJson(Map<String, dynamic> json) =>
      ResponseEnrollSubject(
        status: json["status"],
        message: json["message"],
      );
}
