import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_siparis/model/favori.dart';
import 'package:firestore_siparis/model/sepet.dart';
import 'package:firestore_siparis/model/urunler.dart';
import 'package:firestore_siparis/repo/repo%C4%B0slemleri.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriCubit extends Cubit<List<Urunler>>{
  FavoriCubit():super(<Urunler>[]);

  var collectionSepet=FirebaseFirestore.instance.collection("kullanici");
  var repoEris=RepoSiparis();

  late Stream<List<Urunler>>? _urunStream;
  List<Urunler> urunler = [];
  Future urunleriGetir(Favori favoriItem) async {
    _urunStream = await repoEris.getSnapshotsFavori();
    _urunStream!.listen((data) {
      urunler = data;
      emit(urunler);
    });
  }



  Future<void> addToSFavori(Favori favoriItem,Urunler urunler) async {
    try {
      // Sepet koleksiyonuna ve belirli bir sepet ID'sine referans oluştur
      final cartRef = FirebaseFirestore.instance
          .collection('kullanici')
          .doc(favoriItem.favoriId)
          .collection("favori")
          .doc(urunler.urunId);

      // Sepet koleksiyonuna ürün eklemek için set metodu kullanabilirsiniz
      await cartRef.set({
        'urunId': urunler.urunId,
        'urunAdi': urunler.urunAdi,
        'urunResim': urunler.urunResim,
        'urunFiyat': urunler.urunFiyat,
      });

      print('Ürün başarıyla favoriye eklendi!');
    } catch (error) {
      print('Hata: $error');
    }
  }

Future<void>silme(String id)async{
    await repoEris.delete(id);
}
}