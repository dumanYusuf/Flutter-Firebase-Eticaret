import 'package:firestore_siparis/cubit/favoriCubit.dart';
import 'package:firestore_siparis/model/favori.dart';
import 'package:firestore_siparis/model/urunler.dart';
import 'package:firestore_siparis/view/detaySayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FavoriSayfa extends StatefulWidget {
  @override
  _FavoriSayfaState createState() => _FavoriSayfaState();
}

class _FavoriSayfaState extends State<FavoriSayfa> {

  final Favori favori = Favori(favoriId: 'jmG9qyfh28L7XvttBTqp');

  @override
  void initState() {
    super.initState();
    context.read<FavoriCubit>().urunleriGetir(favori);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriCubit, List<Urunler>>(
      builder: (context, urunler) {
        print("block builder calıstı favori");
        return Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: urunler.length,
            itemBuilder: (context, index) {
              var oankiUrun = urunler[index];
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetaySayfa(urunler: oankiUrun)));
                },
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(oankiUrun.urunResim),
                    ),
                    title: Text(oankiUrun.urunAdi),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              //context.read<FavoriCubit>().silme(oankiUrun.urunId);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.grey,
                                      content:const  Text("Ürun favoriden Silinsinmi",style: TextStyle(fontSize: 20),),
                                      action:SnackBarAction(label: "Evet", onPressed: (){
                                        context.read<FavoriCubit>().silme(oankiUrun.urunId);
                                      }) )
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          Text(" ${oankiUrun.urunFiyat}Tl "),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
