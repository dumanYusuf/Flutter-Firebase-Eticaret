class Kullanici{
  String id;
  String kullaniciAdi;
  String kullaniciMail;
  String kullaniciSifre;

  Kullanici({required this.id,required this.kullaniciAdi,required this.kullaniciMail,required this.kullaniciSifre});

 factory Kullanici.fromJson(Map<String,dynamic>json,String key){
    return Kullanici(
        id: key,
        kullaniciAdi: json["kullaniciAdi"],
        kullaniciMail: json["kullaniciMail"],
        kullaniciSifre: json["kullaniciSifre"]);
  }
}