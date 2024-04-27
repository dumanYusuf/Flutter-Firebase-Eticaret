import 'package:firestore_siparis/cubit/favoriCubit.dart';
import 'package:firestore_siparis/cubit/sepetcubit.dart';
import 'package:firestore_siparis/cubit/urunGetirFirebase.dart';
import 'package:firestore_siparis/model/favori.dart';
import 'package:firestore_siparis/model/sepet.dart';
import 'package:firestore_siparis/model/urunler.dart';
import 'package:firestore_siparis/view/detaySayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  void initState() {
    super.initState();
    context.read<UrunGetirCubit>().urunGetir();
  }

  TextEditingController urunAdi=TextEditingController();
  final Sepet sepet = Sepet(sepetId: 'NnqXnwszgTDkLitxsJ5j');
  final Favori favori=Favori(favoriId:'jmG9qyfh28L7XvttBTqp');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
       TextFormField(
          controller: urunAdi,
          decoration: InputDecoration(
            hintText: 'Ürün Ara...',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
             contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.left,
          onChanged: (ara){
            context.read<UrunGetirCubit>().urunAra(ara);
          },
        ),

        BlocBuilder<UrunGetirCubit, List<Urunler>>(
          builder: (context, urunListem) {
            print("urun getir cubit calıstı");
            if (urunListem.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: urunListem.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 230
                  ),
                  itemBuilder: (context, index) {
                    var oankiUrun = urunListem[index];
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetaySayfa(urunler: oankiUrun,)));
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        child: Column(
                          children: [
                            Container(
                              width: 150,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(oankiUrun.urunResim),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                oankiUrun.urunAdi,
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Row(
                              children:  [
                                Icon(Icons.bike_scooter),
                                SizedBox(width: 10),
                                Text(
                                  "ücretsiz Gönderim",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(oankiUrun.urunFiyat.toString() + "tl",style: TextStyle(fontSize: 20),),
                                IconButton(onPressed: (){
                                  context.read<SepetCubit>().addToCart(sepet,oankiUrun);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.grey,
                                          content:const  Text("Ürun Sepete Başarıyla Eklendi",style: TextStyle(fontSize: 20),),
                                          action:SnackBarAction(label: "", onPressed: (){}) )
                                  );
                                }, icon: Icon(Icons.shopping_basket)),
                                IconButton(onPressed: (){
                                  context.read<FavoriCubit>().addToSFavori(favori, oankiUrun);
                                  print("urun favorilere eklendi");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const   SnackBar(
                                      backgroundColor: Colors.grey,
                                        content: Text("Ürün Başarıyla Favorilere Eklendi",style: TextStyle(fontSize: 20),))
                                  );
                                }, icon: Icon(Icons.favorite_outline))

                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }
}
