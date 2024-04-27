import 'package:firestore_siparis/cubit/sepetcubit.dart';
import 'package:firestore_siparis/model/sepet.dart';
import 'package:firestore_siparis/model/urunler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SepetimSayfa extends StatefulWidget {
  @override
  _SepetimSayfaState createState() => _SepetimSayfaState();
}

class _SepetimSayfaState extends State<SepetimSayfa> {

  final Sepet sepet = Sepet(sepetId: 'NnqXnwszgTDkLitxsJ5j');
  int adet=0;
  int toplamfiyat=0;

  @override
  void initState() {
    super.initState();
    context.read<SepetCubit>().urunleriGetir(sepet);
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<SepetCubit, List<Urunler>>(
          builder: (context, urunler) {
            print("block builder calıstı sepet");
            return Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: urunler.length,
                itemBuilder: (context, index) {
                  var oankiUrun = urunler[index];
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(oankiUrun.urunResim),
                      ),
                      title: Text(oankiUrun.urunAdi),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                if(adet>0){
                                  setState(() {
                                    adet--;
                                    toplamfiyat=oankiUrun.urunFiyat;
                                  });
                                }
                              },
                              child: const Text(
                                  "-", style: TextStyle(fontSize: 20)),
                            ),
                          ),
                          Text(adet.toString()),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  adet++;
                                  toplamfiyat=adet*oankiUrun.urunFiyat;
                                });
                              },
                              child: const Text(
                                  "+", style: TextStyle(fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                //  context.read<SepetCubit>().sil(oankiUrun.urunId);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.grey,
                                        content:const  Text("Ürun Sepetten Silinsin mi?",style: TextStyle(fontSize: 20),),
                                        action:SnackBarAction(label: "Evet", onPressed: (){
                                          context.read<SepetCubit>().sil(oankiUrun.urunId);
                                        }) )
                                );
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            Text("${oankiUrun.urunFiyat.toString()}"),
                            //Text(" ${toplamfiyat.toStringAsFixed(2)} "),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        Positioned(
          top: 700,
            left: 10,
            bottom: 10,
            child: Row(
              children: [
                Text("Toplam Fiyat:${toplamfiyat.toString()}",style: TextStyle(fontSize: 20),),
                TextButton(onPressed: (){
                  print("Siparişiniz Alındı");
                }, child: const Text("Sepeti Onayla",style: TextStyle(fontSize: 20),))
              ],
            ))
      ],
    );
  }
}
