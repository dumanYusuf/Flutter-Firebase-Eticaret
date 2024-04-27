import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_siparis/cubit/favoriCubit.dart';
import 'package:firestore_siparis/cubit/secilenMenuItemCubit.dart';
import 'package:firestore_siparis/cubit/sepetcubit.dart';
import 'package:firestore_siparis/cubit/urunGetirFirebase.dart';
import 'package:firestore_siparis/view/bodySayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>SecilenMenuItemCubit()),
        BlocProvider(create: (context)=>UrunGetirCubit()),
        BlocProvider(create: (context)=>SepetCubit()),
        BlocProvider(create: (context)=>FavoriCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BodySayfa(),
      ),
    );
  }
}