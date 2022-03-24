class School {
  School({
    required this.id,
    required this.fullName,
    required this.acronym,
  });

  int id;
  String fullName;
  String acronym;

  factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["id"],
        fullName: json["nombre_completo"],
        acronym: json["acronimo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre_completo": fullName,
        "acronimo": acronym,
      };
}
