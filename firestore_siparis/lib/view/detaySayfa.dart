import 'package:firestore_siparis/cubit/sepetcubit.dart';
import 'package:firestore_siparis/model/sepet.dart';
import 'package:firestore_siparis/model/urunler.dart';
import 'package:firestore_siparis/view/sepetimSayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetaySayfa extends StatefulWidget {
  Urunler urunler;

  DetaySayfa({required this.urunler});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  int adet = 0;
  int toplamFiyat = 0;

  final Sepet sepet = Sepet(sepetId: 'NnqXnwszgTDkLitxsJ5j');
  List<Urunler>urunler=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Urun Detayi",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SepetimSayfa()));
          }, child: Text("Sepete Git",style: TextStyle(fontSize: 24),))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.urunler.urunResim),
                  ),
                ),
              ),
            ),
            Text(
              "${widget.urunler.urunFiyat.toString()}tl",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              widget.urunler.urunAdi,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (adet > 0) {
                      setState(() {
                        adet--;
                        toplamFiyat = adet * widget.urunler.urunFiyat;
                      });
                    }
                  },
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(adet.toString()),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      adet++;
                      toplamFiyat = adet * widget.urunler.urunFiyat;
                    });
                  },
                  child: Text("+"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Toplam ${toplamFiyat.toStringAsFixed(2)} tl",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<SepetCubit>().addToCart(sepet, widget.urunler);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: Colors.grey,
                            content:const  Text("Ürun Sepete Başarıyla Eklendi",style: TextStyle(fontSize: 20),),
                            action:SnackBarAction(label: "", onPressed: (){}) )
                    );
                  },
                  child: Text("Sepete Ekle",style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
