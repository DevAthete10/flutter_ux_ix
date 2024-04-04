// ignore_for_file: unnecessary_getters_setters

import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceHttpMarvel {
  
  final String _urlBase = "gateway.marvel.com";
  final String _apikey = "0cd7c004ffaf6e7ddb0a9a4b7fbbce03";
  final String _hash = "64a6ef1de4621163fad8f4b250c8745c";
  final String _ts = "1";
  List _datos = [];
  List get lista => _datos;
  
    set lista(List lista){
      _datos = lista;
  }


  Future<List> getMarvel()async{
     Uri url = Uri.http(_urlBase,"/v1/public/characters",{
      "ts":_ts,
      "apikey":_apikey,
      "hash":_hash,
      "limit":"50"
      });

      print(url);

     final resp = await http.get(url);
     
     if(resp.statusCode == 200){
     Map<String, dynamic> body = await json.decode(resp.body);
       lista.addAll(body["data"]["results"]); 
       print("body");
      }

     return lista;

  }

}