import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cupidum_app/utils/enum_convertors.dart';

enum Gender { male, female }

enum Faculty { fitec }

class User {
  String uid;
  String name;
  String description;
  Gender gender;
  List<dynamic> hobbies;
  int age;
  DateTime bornDate;
  Faculty school;
  double? height;
  double? weight;
  String? phone;
  String? instagram;
  User({
    required this.uid,
    required this.name,
    required this.description,
    required this.gender,
    required this.hobbies,
    required this.age,
    required this.bornDate,
    required this.school,
    this.height,
    this.weight,
    this.phone,
    this.instagram,
  });

  User copyWith({
    String? uid,
    String? name,
    String? description,
    Gender? gender,
    List<dynamic>? hobbies,
    int? age,
    DateTime? bornDate,
    Faculty? school,
    double? height,
    double? weight,
    String? phone,
    String? instagram,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      description: description ?? this.description,
      gender: gender ?? this.gender,
      hobbies: hobbies ?? this.hobbies,
      age: age ?? this.age,
      bornDate: bornDate ?? this.bornDate,
      school: school ?? this.school,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      phone: phone ?? this.phone,
      instagram: instagram ?? this.instagram,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'gender': enumToString(gender),
      'hobbies': hobbies,
      'age': age,
      'bornDate': bornDate.millisecondsSinceEpoch,
      'school': enumToString(school),
      'height': height,
      'weight': weight,
      'phone': phone,
      'instagram': instagram,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      gender: enumFromString<Gender>(map['gender'], Gender.values)!,
      hobbies: List<dynamic>.from(map['hobbies']),
      age: map['age']?.toInt() ?? 0,
      bornDate: DateTime.fromMillisecondsSinceEpoch(map['bornDate']),
      school: enumFromString<Faculty>(map['faculty'], Faculty.values)!,
      height: map['height']?.toDouble(),
      weight: map['weight']?.toDouble(),
      phone: map['phone'],
      instagram: map['instagram'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, description: $description, gender: $gender, hobbies: $hobbies, age: $age, bornDate: $bornDate, school: $school, height: $height, weight: $weight, phone: $phone, instagram: $instagram)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uid == uid &&
        other.name == name &&
        other.description == description &&
        other.gender == gender &&
        listEquals(other.hobbies, hobbies) &&
        other.age == age &&
        other.bornDate == bornDate &&
        other.school == school &&
        other.height == height &&
        other.weight == weight &&
        other.phone == phone &&
        other.instagram == instagram;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        description.hashCode ^
        gender.hashCode ^
        hobbies.hashCode ^
        age.hashCode ^
        bornDate.hashCode ^
        school.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        phone.hashCode ^
        instagram.hashCode;
  }
}
