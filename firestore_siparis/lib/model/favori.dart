class Favori {
  String favoriId;

  Favori({required this.favoriId});

  factory Favori.fromJson(Map<String, dynamic> json, String key) {
    return Favori(favoriId: json[key]);
  }
}
