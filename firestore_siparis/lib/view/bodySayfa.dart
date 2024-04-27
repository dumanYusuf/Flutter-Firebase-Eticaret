import 'package:firestore_siparis/cubit/secilenMenuItemCubit.dart';
import 'package:firestore_siparis/view/FavoriSayfa.dart';
import 'package:firestore_siparis/view/HesabimSayfa.dart';
import 'package:firestore_siparis/view/anaSayfa.dart';
import 'package:firestore_siparis/view/sepetimSayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodySayfa extends StatefulWidget {
  const BodySayfa({super.key});

  @override
  State<BodySayfa> createState() => _BodySayfaState();
}

int secilenMenuItem=0;
late List<Widget>tumSayfalar;
late AnaSayfa anaSayfa;
late FavoriSayfa favoriSayfa;
late SepetimSayfa sepetimSayfa;
late HesabimSayfa hesabimSayfa;


class _BodySayfaState extends State<BodySayfa> {

  @override
  void initState() {
    super.initState();
    anaSayfa=AnaSayfa();
    favoriSayfa=FavoriSayfa();
    sepetimSayfa=SepetimSayfa();
    hesabimSayfa=HesabimSayfa();

    tumSayfalar=[anaSayfa,favoriSayfa,sepetimSayfa,hesabimSayfa];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: CupertinoSearchTextField(),),
      body: BlocBuilder<SecilenMenuItemCubit,int>(
          builder: (context, state) {
           return tumSayfalar[state];
          }),
       bottomNavigationBar: BlocBuilder<SecilenMenuItemCubit, int>(
            builder: (context, state) {
              return BottomNavigationBar(
           items:const [
             BottomNavigationBarItem(icon: Icon(Icons.home),label: "AnaSayfa"),
             BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: "Favorilerim"),
             BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: "Sepetim"),
             BottomNavigationBarItem(icon: Icon(Icons.person),label: "Hesabım")
           ],
         selectedItemColor: Colors.blue.shade700,
         type: BottomNavigationBarType.fixed,
         currentIndex:state,
         onTap: (index){
            context.read<SecilenMenuItemCubit>().degistir(index);
         },
       );
  },
),
    );
  }
}
