import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_siparis/model/sepet.dart';
import 'package:firestore_siparis/model/urunler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UrunGetirCubit extends Cubit<List<Urunler>> {
  UrunGetirCubit() : super(<Urunler>[]);

  var collectionUrunler = FirebaseFirestore.instance.collection("urunler");

  Future<void> urunGetir() async {
    collectionUrunler.snapshots().listen((event) {
      var urunListem = <Urunler>[];
      var documents = event.docs;

      for(var document in documents){
        var key=document.id;
        var data=document.data();
        var listem=Urunler.fromJson(data, key);
        urunListem.add(listem);
      }
      emit(urunListem);
    }
    );
  }



  Future<void> urunAra(String aramaKelimesi) async {
    collectionUrunler.snapshots().listen((event) {
      var urunListem = <Urunler>[];
      var documents = event.docs;

      for(var document in documents){
        var key=document.id;
        var data=document.data();
        var listem=Urunler.fromJson(data, key);

        if(listem.urunAdi.toLowerCase().contains(aramaKelimesi.toLowerCase())){
          urunListem.add(listem);
        }
      }
      emit(urunListem);
    }
    );
  }

}