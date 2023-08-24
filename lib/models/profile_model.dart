class KGUser {
  KGUser({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  KGUserModel? data;

  factory KGUser.fromJson(Map<String, dynamic> json) => KGUser(
        success: json["success"],
        message: json["message"],
        data: KGUserModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class KGUserModel {
  KGUserModel({
    this.fullName,
    this.username,
    this.email,
    this.gender,
    this.phone,
    this.displayPicture,
    this.displayPictureLink,
    this.address,
    this.role,
    this.studentId,
  });

  String? fullName;
  String? username;
  String? email;
  String? gender;
  String? phone;
  String? displayPicture;
  String? displayPictureLink;
  String? address;
  String? role;
  String? studentId;

  factory KGUserModel.fromJson(Map<String, dynamic> json) => KGUserModel(
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        gender: json["gender"],
        phone: json["phone"],
        displayPicture: json["display_picture"],
        displayPictureLink: json["display_picture_link"],
        address: json["address"],
        role: json["role"],
        studentId: json["student_id"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "username": username,
        "email": email,
        "gender": gender,
        "phone": phone,
        "display_picture": displayPicture,
        "display_picture_link": displayPictureLink,
        "address": address,
        "role": role,
        "student_id": studentId,
      };
}
