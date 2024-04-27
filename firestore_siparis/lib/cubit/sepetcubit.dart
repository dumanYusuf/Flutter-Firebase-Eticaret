import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_siparis/model/sepet.dart';
import 'package:firestore_siparis/model/urunler.dart';
import 'package:firestore_siparis/repo/repo%C4%B0slemleri.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetCubit extends Cubit<List<Urunler>>{
  SepetCubit():super(<Urunler>[]);

  var collectionSepet=FirebaseFirestore.instance.collection("kullanici");
  var repoEris=RepoSiparis();

  late Stream<List<Urunler>>? _urunStream;
  List<Urunler> urunler = [];
  Future urunleriGetir(Sepet sepetItem) async {
    /*
    try {
      List<Urunler> productList = [];
      final QuerySnapshot<Map<String, dynamic>> snapshot = await collectionSepet.doc(sepetItem.sepetId).collection('sepet').get();

      for (var doc in snapshot.docs) {
        urunler.add(Urunler.fromJson(doc.data() as Map<String, dynamic>, doc.id));
      }
      emit(urunler);

    } catch (e) {
      print("Error getting products by category: $e");
      return [];
    }

     */
    _urunStream = await repoEris.getSnapshotsSepet();
    _urunStream!.listen((data) {
      urunler = data;
      emit(urunler);
    });
  }

  Future<void> addToCart(Sepet sepetItem,Urunler urunler) async {
    try {
      // Sepet koleksiyonuna ve belirli bir sepet ID'sine referans oluştur
      final cartRef = FirebaseFirestore.instance
          .collection('kullanici')
          .doc(sepetItem.sepetId)
          .collection("sepet")
          .doc(urunler.urunId);

      // Sepet koleksiyonuna ürün eklemek için set metodu kullanabilirsiniz
      await cartRef.set({
        'urunId': urunler.urunId,
        'urunAdi': urunler.urunAdi,
        'urunResim': urunler.urunResim,
        'urunFiyat': urunler.urunFiyat,
      });

      print('Ürün başarıyla sepete eklendi!');
    } catch (error) {
      print('Hata: $error');
    }
  }

  Future<void>sil(String id)async{
    await repoEris.silme(id);
  }
}