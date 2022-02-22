class Hobby {
  Hobby({
    required this.id,
    required this.title,
    required this.icon,
  });

  int id;
  String title;
  String icon;

  factory Hobby.fromJson(Map<String, dynamic> json) => Hobby(
        id: json["id"],
        title: json["titulo"],
        icon: json["icono"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icono": icon,
      };
}
