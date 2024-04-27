import 'dart:ui';
import 'package:firestore_siparis/view/anaSayfa.dart';
import 'package:firestore_siparis/view/bodySayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../animasyon/animasyon.dart';

class HesabimSayfa extends StatefulWidget {
  const HesabimSayfa({super.key});

  @override
  State<HesabimSayfa> createState() => _HesabimSayfaState();
}

class _HesabimSayfaState extends State<HesabimSayfa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const   Padding(
            padding:  EdgeInsets.only(top: 30),
            child: Center(child: ShopAnimasyon()),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container (
                  width: 60,
                  height: 60,
                  decoration:const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://cdn.cimri.io/image/1200x1200/asus-vivobook-15-x1504va-nj123w-i5-1335u-8gb-ram-512gb-ssd-windows-11-15-6-inc-fhd-mavi-laptop-notebook_869760792.jpg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/seksifoto.jpg")
                  ),
                ),
              ),
              const Column(
                children:  [
                  Text("Yusuf Duman",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("dumanyusuf@gmail.com")
                ],
              )
            ],
          ),
          const  SizedBox(height: 10,),
          const Text("İnformation",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          InkWell(
            onTap: (){
             // Navigator.of(context).push(MaterialPageRoute(builder: (contex)=>AnaSayfa()));
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Container(
                  decoration:const  BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://imzalikitabim.com/wp-content/uploads/2018/02/S%C4%B0TE-%C4%B0CON-03-min.png"),fit: BoxFit.cover)
                  ),
                ),
              ),
              title:const  Text("All Products",style: TextStyle(fontSize: 20),),
              trailing: IconButton(onPressed: (){
              }, icon:const Icon(Icons.navigate_next_outlined,size: 30,)),
            ),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Favorite()));
            },
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite,color: Colors.red,),
              ),
              title:const  Text("Favorite",style: TextStyle(fontSize: 20),),
              trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.navigate_next_outlined,size: 30,)),
            ),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: (){
              //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewRecently()));
            },
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.hourglass_bottom),
              ),
              title:const  Text("Wiewed Recentyl",style: TextStyle(fontSize: 20),),
              trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.navigate_next_outlined,size: 30,)),
            ),
          ),
          const SizedBox(height: 10,),
          ListTile(
            leading:  const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.location_on_sharp),
            ),
            title:const  Text("Konum",style: TextStyle(fontSize: 20),),
            trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.navigate_next_outlined,size: 30,)),
          ),
          const  Divider(),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.settings),
            ),
            title:const  Text("Adress",style: TextStyle(fontSize: 20),),
            trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.navigate_next_outlined,size: 30,)),
          ),

          Center(
            child: ElevatedButton.icon(
                onPressed: (){
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                icon:const  Icon(Icons.login),
                label:const  Text("Log out")
            ),
          )
        ],
      ),
    );
  }
}
