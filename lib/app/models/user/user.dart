// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'gender.dart';
import 'hobby.dart';
import 'objective.dart';
import 'school.dart';

class User {
  User({
    required this.id,
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
    this.school,
    required this.hobbies,
    required this.image,
  });

  int id;
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
  School? school;
  List<Hobby> hobbies;
  String image;

  String get fullName => "$name $lastName";

  static User userFromJson(String str) => User.fromJson(json.decode(str));

  static String userToJson(User data) => json.encode(data.toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
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
        school: (json["facultad"] != null &&
                json["facultad"] is Map<String, dynamic>)
            ? School.fromJson(json["facultad"])
            : null,
        hobbies: json["hobbies"] != null
            ? List<Hobby>.from(json["hobbies"].map((x) => Hobby.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "facultad": school!.toJson(),
        "hobbies": List<dynamic>.from(hobbies.map((x) => x.toJson())),
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.uid == uid &&
        other.name == name &&
        other.lastName == lastName &&
        other.description == description &&
        other.gender == gender &&
        other.objective == objective &&
        other.bornDate == bornDate &&
        other.age == age &&
        other.height == height &&
        other.weight == weight &&
        other.phone == phone &&
        other.instagram == instagram &&
        other.school == school &&
        listEquals(other.hobbies, hobbies);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        uid.hashCode ^
        lastName.hashCode ^
        description.hashCode ^
        gender.hashCode ^
        objective.hashCode ^
        bornDate.hashCode ^
        age.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        phone.hashCode ^
        instagram.hashCode ^
        school.hashCode ^
        hobbies.hashCode;
  }
}
