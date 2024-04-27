import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/urunler.dart';

class RepoSiparis{

  var collectionSepet=FirebaseFirestore.instance.collection("kullanici").doc("NnqXnwszgTDkLitxsJ5j").collection("sepet");
  var collectionFavori=FirebaseFirestore.instance.collection("kullanici").doc("jmG9qyfh28L7XvttBTqp").collection("favori");


  Future<void>silme(String id)async{
      await collectionSepet.doc(id).delete();
  }

  Future getSnapshotsSepet ()async{
    return collectionSepet.snapshots().map((snapshots) => snapshots.docs.map((e) => Urunler.fromJson(e.data(),e.id)).toList());
  }


  Future getSnapshotsFavori ()async{
    return collectionFavori.snapshots().map((snapshots) => snapshots.docs.map((e) => Urunler.fromJson(e.data(),e.id)).toList());
  }

  Future<void>delete(String id)async{
    await collectionFavori.doc(id).delete();
  }

}