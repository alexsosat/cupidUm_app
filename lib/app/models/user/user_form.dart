// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'gender.dart';
import 'hobby.dart';
import 'objective.dart';
import 'school.dart';

class UserForm {
  String? name;
  String? description;
  Gender? gender;
  Objective? objective;
  DateTime? bornDate;
  int? age;
  double? height;
  double? weight;
  String? phone;
  String? instagram;
  School? school;
  List<Hobby>? hobbies;
  UserForm({
    this.name,
    this.description,
    this.gender,
    this.objective,
    this.bornDate,
    this.age,
    this.height,
    this.weight,
    this.phone,
    this.instagram,
    this.school,
    this.hobbies,
  });

  UserForm copyWith({
    String? name,
    String? description,
    Gender? gender,
    Objective? objective,
    DateTime? bornDate,
    int? age,
    double? height,
    double? weight,
    String? phone,
    String? instagram,
    School? school,
    List<Hobby>? hobbies,
  }) {
    return UserForm(
      name: name ?? this.name,
      description: description ?? this.description,
      gender: gender ?? this.gender,
      objective: objective ?? this.objective,
      bornDate: bornDate ?? this.bornDate,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      phone: phone ?? this.phone,
      instagram: instagram ?? this.instagram,
      school: school ?? this.school,
      hobbies: hobbies ?? this.hobbies,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if (name != null) map["nombre"] = name;
    if (description != null) map["descripcion"] = description;
    if (gender != null) map["genero"] = genderToString(gender!);
    if (objective != null) map["objetivo"] = objectiveToString(objective!);
    if (bornDate != null) {
      map["fecha_nacimiento"] =
          "${bornDate!.year.toString().padLeft(4, '0')}-${bornDate!.month.toString().padLeft(2, '0')}-${bornDate!.day.toString().padLeft(2, '0')}";
    }
    if (age != null) map["edad"] = age;
    if (height != null) map["altura"] = height;
    if (weight != null) map["peso"] = weight;
    if (phone != null) map["telefono"] = phone;
    if (instagram != null) map["instagram"] = instagram;
    if (school != null) map["facultad"] = school!.toJson();
    if (hobbies != null) {
      map["hobbies"] = List<dynamic>.from(hobbies!.map((x) => x.toJson()));
    }

    return map;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Demo(name: $name, description: $description, gender: $gender, objective: $objective, bornDate: $bornDate, age: $age, height: $height, weight: $weight, phone: $phone, instagram: $instagram, school: $school, hobbies: $hobbies)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserForm &&
        other.name == name &&
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
