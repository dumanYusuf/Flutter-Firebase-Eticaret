class Sepet {
  String sepetId;

  Sepet({required this.sepetId});

  factory Sepet.fromJson(Map<String, dynamic> json, String key) {
    return Sepet(sepetId: json[key]);
  }
}
