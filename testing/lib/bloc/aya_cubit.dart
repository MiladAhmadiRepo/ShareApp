import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:testing/bloc/AyaModel.dart';
part 'aya_state.dart';

class AyaCubit extends Cubit<AyaState> {

  final String apiAddress = "http://api.alquran.cloud/v1/ayah/262";
  Client? client;
  AyaCubit({this.client}) : super(AyaState(status: DataStatus.initial)){
    _start(client);
  }

  _start(Client? client){
    _getRandomAya(client ?? Client());
  }
  
  _getRandomAya(Client client) async {
    emit(AyaState(status: DataStatus.loading));
    Response response = await client.get(Uri.parse(apiAddress));
    if(response.statusCode != 200){
      emit(AyaState(status: DataStatus.failure,error: response.statusCode.toString()));
    }else{
      var aya = await compute(_parsJsonData,response);
      emit(AyaState(status: DataStatus.success,ayaModel: aya));
    }
  }

}
AyaModel _parsJsonData(Response response){
  var ayaModel = AyaModel.fromJson(json.decode(response.body));
  return ayaModel;
}