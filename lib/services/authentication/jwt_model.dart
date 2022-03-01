import 'dart:convert';

class JwtModel {
  String jwt;

  JwtModel({required this.jwt});

  @override
  String toString() => 'JwtModel(jwt: $jwt)';

  factory JwtModel.fromMap(Map<String, dynamic> data) => JwtModel(
        jwt: data['jwt'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [JwtModel].
  factory JwtModel.fromJson(String data) {
    return JwtModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
