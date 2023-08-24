class Administrasi {
  Administrasi({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  AdministrasiModels? data;

  factory Administrasi.fromJson(Map<String, dynamic> json) => Administrasi(
        status: json["status"],
        message: json["message"],
        data: AdministrasiModels.fromJson(json["data"]),
      );
}

class AdministrasiModels {
  AdministrasiModels({
    this.administrationId,
    this.degree,
    this.biodata,
    this.familial,
    this.files,
  });

  String? administrationId;
  String? degree;
  Biodata? biodata;
  Familial? familial;
  Files? files;

  factory AdministrasiModels.fromJson(Map<String, dynamic> json) =>
      AdministrasiModels(
        administrationId: json["administration_id"],
        degree: json["degree"],
        biodata:
            json["biodata"] == null ? null : Biodata.fromJson(json["biodata"]),
        familial: json["familial"] == null
            ? null
            : Familial.fromJson(json["familial"]),
        files: json["files"] == null ? null : Files.fromJson(json["files"]),
      );
}

class Biodata {
  Biodata({
    this.fullName,
    this.email,
    this.nin,
    this.studyProgram,
    this.semester,
    this.ninAddress,
    this.residenceAddress,
    this.birthPlace,
    this.birthDate,
    this.phone,
    this.gender,
    this.nsn,
    this.universityOfOrigin,
  });

  String? fullName;
  String? email;
  String? nin;
  String? studyProgram;
  String? semester;
  String? ninAddress;
  String? residenceAddress;
  String? birthPlace;
  String? birthDate;
  String? phone;
  String? gender;
  String? nsn;
  String? universityOfOrigin;

  factory Biodata.fromJson(Map<String, dynamic> json) => Biodata(
        fullName: json["full_name"],
        email: json["email"],
        nin: json["nin"],
        studyProgram: json["study_program"],
        semester: json["semester"],
        ninAddress: json["nin_address"],
        residenceAddress: json["residence_address"],
        birthPlace: json["birth_place"],
        birthDate: json["birth_date"],
        phone: json["phone"],
        gender: json["gender"],
        nsn: json["nsn"],
        universityOfOrigin: json["university_of_origin"],
      );
}

class Familial {
  Familial({
    this.fatherName,
    this.fatherOccupation,
    this.fatherIncome,
    this.motherName,
    this.motherOccupation,
    this.motherIncome,
    this.occupation,
    this.income,
    this.livingPartner,
    this.financier,
  });

  String? fatherName;
  String? fatherOccupation;
  String? fatherIncome;
  String? motherName;
  String? motherOccupation;
  String? motherIncome;
  String? occupation;
  String? income;
  String? livingPartner;
  String? financier;

  factory Familial.fromJson(Map<String, dynamic> json) => Familial(
        fatherName: json["father_name"],
        fatherOccupation: json["father_occupation"],
        fatherIncome: json["father_income"],
        motherName: json["mother_name"],
        motherOccupation: json["mother_occupation"],
        motherIncome: json["mother_income"],
        occupation: json["occupation"],
        income: json["income"],
        livingPartner: json["living_partner"],
        financier: json["financier"],
      );
}

class Files {
  Files({
    this.integrityPact,
    this.ninCard,
    this.familyCard,
    this.certificate,
    this.photo,
    this.transcript,
    this.recommendationLetter,
  });

  dynamic integrityPact;
  dynamic ninCard;
  dynamic familyCard;
  dynamic certificate;
  dynamic photo;
  dynamic transcript;
  dynamic recommendationLetter;

  factory Files.fromJson(Map<String, dynamic> json) => Files(
        integrityPact: json["integrity_pact"],
        ninCard: json["nin_card"],
        familyCard: json["family_card"],
        certificate: json["certificate"],
        photo: json["photo"],
        transcript: json["transcript"],
        recommendationLetter: json["recommendation_letter"],
      );

}
