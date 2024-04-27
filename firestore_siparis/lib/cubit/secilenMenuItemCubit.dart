import 'package:flutter_bloc/flutter_bloc.dart';

class SecilenMenuItemCubit extends Cubit<int>{
  SecilenMenuItemCubit():super(0);

  int secilenMenuItem=0;

  void degistir(int value){
    secilenMenuItem=value;
    emit(secilenMenuItem);
  }
}