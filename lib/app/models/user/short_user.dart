import 'dart:convert';

class ShortUser {
  int id;
  String uid;
  String name;
  String lastName;
  ShortUser({
    required this.id,
    required this.uid,
    required this.name,
    required this.lastName,
  });

  ShortUser copyWith({
    int? id,
    String? uid,
    String? name,
    String? lastName,
  }) {
    return ShortUser(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'UID': uid,
      'nombre': name,
      'apellidos': lastName,
    };
  }

  factory ShortUser.fromMap(Map<String, dynamic> map) {
    return ShortUser(
      id: map['id']?.toInt() ?? 0,
      uid: map['UID'] ?? '',
      name: map['nombre'] ?? '',
      lastName: map['apellidos'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortUser.fromJson(String source) =>
      ShortUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShortUser(id: $id, uid: $uid, name: $name, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShortUser &&
        other.id == id &&
        other.uid == uid &&
        other.name == name &&
        other.lastName == lastName;
  }

  @override
  int get hashCode {
    return id.hashCode ^ uid.hashCode ^ name.hashCode ^ lastName.hashCode;
  }
}
