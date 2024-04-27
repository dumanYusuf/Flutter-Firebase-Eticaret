class Urunler{
  String urunId;
  String urunAdi;
  int urunFiyat;
  String urunResim;

  Urunler({required this.urunId,required this.urunAdi,required this.urunFiyat,required this.urunResim});

  factory Urunler.fromJson(Map<String,dynamic>json,String key){
    return Urunler(
        urunId: key,
        urunAdi: json["urunAdi"],
        urunFiyat: json["urunFiyat"],
        urunResim: json["urunResim"]);
  }
}