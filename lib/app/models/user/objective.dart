enum Objective {
  friendship,
  relationship,
}

Objective getUserObjective(String value) {
  switch (value) {
    case "Amistad":
      return Objective.friendship;
    case "Relacion":
      return Objective.relationship;
    default:
      return Objective.friendship;
  }
}

String objectiveToString(Objective value) {
  switch (value) {
    case Objective.friendship:
      return "Amistad";
    case Objective.relationship:
      return "Relacion";
    default:
      return "Amistad";
  }
}
