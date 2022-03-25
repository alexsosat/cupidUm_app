import 'dart:convert';

class ClusterForm {
  int religion;
  int distance;
  int personal;
  int impulsive;
  int marry;
  int zodiac;
  int health;
  int problems;
  int ego;
  int family;
  int personality;
  int gym;
  int agree;
  int movies;
  int sex;

  ClusterForm({
    this.religion = 1,
    this.distance = 1,
    this.personal = 1,
    this.impulsive = 1,
    this.marry = 1,
    this.zodiac = 1,
    this.health = 1,
    this.problems = 1,
    this.ego = 1,
    this.family = 1,
    this.personality = 1,
    this.gym = 1,
    this.agree = 1,
    this.movies = 1,
    this.sex = 1,
  });

  bool checkIfAnyIsNull() {
    return [
      religion,
      distance,
      personal,
      impulsive,
      marry,
      zodiac,
      health,
      problems,
      ego,
      family,
      personality,
      gym,
      agree,
      movies,
      sex
    ].contains(null);
  }

  Map<String, dynamic> toMap() {
    return {
      'Religion': religion,
      'Distance': distance,
      'Personal': personal,
      'Impulsive': impulsive,
      'Marry': marry,
      'Zodiac': zodiac,
      'Health': health,
      'Problems': problems,
      'Ego': ego,
      'Family': family,
      'Personality': personality,
      'Gym': gym,
      'Agree': agree,
      'Movies': movies,
      'Sex': sex,
    };
  }

  String toJson() => json.encode(toMap());
}
