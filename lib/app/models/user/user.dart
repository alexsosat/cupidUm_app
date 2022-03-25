// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';
import 'gender.dart';
import 'hobby.dart';
import 'objective.dart';
import 'school.dart';

class User {
  User({
    required this.uid,
    required this.name,
    required this.lastName,
    required this.description,
    required this.gender,
    required this.objective,
    required this.bornDate,
    required this.age,
    this.height,
    this.weight,
    this.phone,
    this.instagram,
    required this.school,
    required this.hobbies,
    required this.image,
  });

  String uid;
  String name;
  String lastName;
  String description;
  Gender gender;
  Objective objective;
  DateTime bornDate;
  int age;
  double? height;
  double? weight;
  String? phone;
  String? instagram;
  School school;
  List<Hobby> hobbies;
  String image;

  String get fullName => "$name $lastName";

  static User userFromJson(String str) => User.fromJson(json.decode(str));

  static String userToJson(User data) => json.encode(data.toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["UID"],
        name: json["nombre"],
        lastName: json["apellidos"],
        description: json["descripcion"],
        gender: getUserGender(json["genero"]),
        objective: getUserObjective(json["objetivo"]),
        bornDate: DateTime.parse(json["fecha_nacimiento"]),
        age: json["edad"],
        height: json["altura"],
        weight: json["peso"],
        phone: json["telefono"],
        instagram: json["instagram"],
        image: json["image"],
        school: School.fromJson(json["facultad"]),
        hobbies:
            List<Hobby>.from(json["hobbies"].map((x) => Hobby.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UID": uid,
        "nombre": name,
        "apellidos": lastName,
        "descripcion": description,
        "genero": genderToString(gender),
        "objetivo": objectiveToString(objective),
        "fecha_nacimiento":
            "${bornDate.year.toString().padLeft(4, '0')}-${bornDate.month.toString().padLeft(2, '0')}-${bornDate.day.toString().padLeft(2, '0')}",
        "edad": age,
        "altura": height,
        "peso": weight,
        "telefono": phone,
        "instagram": instagram,
        "image": image,
        "facultad": school.toJson(),
        "hobbies": List<dynamic>.from(hobbies.map((x) => x.toJson())),
      };
}
