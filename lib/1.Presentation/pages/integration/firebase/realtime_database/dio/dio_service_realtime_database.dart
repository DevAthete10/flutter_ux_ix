import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/firebase/realtime_database/dio/nota_model.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/http/models/usuario_reqres_model.dart';

class ServiceDioRealtimeDatabase {
  
  static final ServiceDioRealtimeDatabase _singleton =  ServiceDioRealtimeDatabase._internal();
  final String _urlBase = "https://app-de-notas-a75a9-default-rtdb.firebaseio.com/"; 
  List<NotaModel> _notas = [];
  NotaModel? notaSeleccionada;
  final StreamController<List<NotaModel>> notasStream = StreamController<List<NotaModel>>.broadcast();
  final Dio _dio = Dio();

    factory ServiceDioRealtimeDatabase() {
    return _singleton;
  }

  Future<bool> getNotas()async{
    bool result = false; 
    if (_notas.isNotEmpty) {
      result = true;          
      return result;
    }
     final resp = await _dio.get("$_urlBase/Notas.json");
      if(resp.statusCode == 200){
        final Map<String,dynamic> data = resp.data;
  
        data.forEach((key, value) {
          final NotaModel temp =NotaModel.fromMap(value);
          _notas.add(temp);
          notasStream.add(_notas);          
          result = true;
         });      

      }
     return result;
  }

  Future<UsuarioReqresModel> getNota(NotaModel usuarioSeleccionado)async{
    late  UsuarioReqresModel result;    
    final resp = await _dio.get("$_urlBase/${usuarioSeleccionado.id}");   
     if(resp.statusCode == 200){
        result = UsuarioReqresModel.fromMap(resp.data);
      }
     return result;
  }

  Future<bool> putNota()async{
    bool result = false;    
    print(notaSeleccionada!.id);
    final resp = await _dio.put("$_urlBase/Notas/${notaSeleccionada!.id}.json",
                                data: notaSeleccionada!.toJson());   
     if(resp.statusCode == 200){
      print(resp);
        result = true;
        final posicion = _notas.indexWhere((nota) => nota.id == notaSeleccionada!.id);

        _notas.removeAt(posicion);
        _notas.insert(posicion, notaSeleccionada!);
        notasStream.add(_notas);
      }
     return result;
  }

  Future<NotaModel> postNota()async{
     late NotaModel result;     
     final resp = await _dio.post("$_urlBase/Notas.json",
                data: notaSeleccionada!.toJson(),
                queryParameters: {"Content-Type":"application/json"});
      if(resp.statusCode == 200){
        resp.data.forEach((key, value) => notaSeleccionada!.id = value );  
        putNota();      
        result = notaSeleccionada!;
        _notas.add(notaSeleccionada!);
        notasStream.add(_notas);
      }
     return result;
  }

  Future<bool> deleteNotaInIosOrAndroid()async{
    bool result = false;    
    final resp = await _dio.delete("$_urlBase/Notas/${notaSeleccionada!.id}.json");
    if (resp.statusCode == 200) {
      final posicion = _notas.indexWhere((nota) => nota.id == notaSeleccionada!.id);  
      _notas.removeAt(posicion);
      notasStream.add(_notas);
       result = true; 
      
    }
     return result;
  }

  List<NotaModel> getData() => _notas;

  ServiceDioRealtimeDatabase._internal();
}