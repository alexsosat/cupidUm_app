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
  String? uid;
  String? name;
  String? lastName;
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
  String? image;
  int? cluster;

  UserForm({
    this.uid,
    this.name,
    this.lastName,
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
    this.image,
    this.cluster,
  });

  UserForm copyWith({
    String? uid,
    String? name,
    String? lastName,
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
    String? image,
    List<Hobby>? hobbies,
    int? cluster,
  }) {
    return UserForm(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
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
      image: image ?? this.image,
      cluster: cluster ?? this.cluster,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if (uid != null) map["UID"] = uid;
    if (name != null) map["nombre"] = name;
    if (lastName != null) map["apellidos"] = lastName;
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
    if (cluster != null) map["cluster"] = cluster;
    if (school != null) map["facultad"] = school!.toJson();
    if (image != null) map["image"] = image;
    if (hobbies != null) {
      map["hobbies"] = List<dynamic>.from(hobbies!.map((x) => x.toJson()));
    }

    return map;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Demo(uid: $uid, name: $name, lastName: $lastName,description: $description, gender: $gender, objective: $objective, cluster: $cluster ,bornDate: $bornDate, age: $age, height: $height, weight: $weight, phone: $phone, instagram: $instagram, school: $school, hobbies: $hobbies, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserForm &&
        other.uid == uid &&
        other.name == name &&
        other.lastName == lastName &&
        other.description == description &&
        other.gender == gender &&
        other.objective == objective &&
        other.bornDate == bornDate &&
        other.age == age &&
        other.cluster == cluster &&
        other.height == height &&
        other.weight == weight &&
        other.phone == phone &&
        other.instagram == instagram &&
        other.school == school &&
        other.image == image &&
        listEquals(other.hobbies, hobbies);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        lastName.hashCode ^
        description.hashCode ^
        gender.hashCode ^
        objective.hashCode ^
        bornDate.hashCode ^
        age.hashCode ^
        cluster.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        phone.hashCode ^
        instagram.hashCode ^
        school.hashCode ^
        image.hashCode ^
        hobbies.hashCode;
  }
}
