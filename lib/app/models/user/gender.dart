enum Gender {
  male,
  female,
  other,
}

Gender getUserGender(String value) {
  switch (value) {
    case "Masculino":
      return Gender.male;
    case "Femenino":
      return Gender.female;
    default:
      return Gender.other;
  }
}

String genderToString(Gender value) {
  switch (value) {
    case Gender.male:
      return "Masculino";
    case Gender.female:
      return "Femenino";
    default:
      return "Otro";
  }
}
