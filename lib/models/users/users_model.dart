class Users {
    Users({
        required this.data,
        this.error,
        this.message,
    });

    UsersModel data;
    bool? error;
    String? message;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        data: UsersModel.fromJson(json["data"]),
        error: json["error"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "error": error,
        "message": message,
    };
}

// class Users {
//     Users({
//         this.error,
//         this.message,
//         required this.data,
//     });

//     bool? error;
//     String? message;
//     List<UsersModel> data;

//     factory Users.fromJson(Map<String, dynamic> json) => Users(
//         error: json["error"],
//         message: json["message"],
//         data: List<UsersModel>.from(json["data"].map((x) => UsersModel.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "error": error,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

class UsersModel {
    UsersModel({
        this.id,
        this.name,
        this.email,
        this.noHp,
        this.gambar,
        this.role,
        this.programId,
    });

    int? id;
    String? name;
    String? email;
    dynamic noHp;
    String? gambar;
    String? role;
    dynamic programId;

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        noHp: json["no_hp"],
        gambar: json["gambar"],
        role: json["role"],
        programId: json["program_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "no_hp": noHp,
        "gambar": gambar,
        "role": role,
        "program_id": programId,
    };
}