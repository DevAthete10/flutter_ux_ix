
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/http/models/usuario_reqres_model.dart';

class ServiceDioReqres {
  
  static final ServiceDioReqres _singleton =  ServiceDioReqres._internal();
  final String _urlBase = "https://reqres.in/api/users"; 
  List<UsuarioReqresModel> _datos = [];
  final dataStream = StreamController<List<UsuarioReqresModel>>.broadcast();
  late UsuarioReqresModel usuarioSeleccionado;
  final Dio _dio = Dio();

    factory ServiceDioReqres() {
    return _singleton;
  }

  Future<bool> getUsers()async{
    bool result = false; 
    if (_datos.isNotEmpty) {
      result = true;          
      return result;
    }
     final resp = await _dio.get(_urlBase,
                                queryParameters: {"per_page":"5"});
      if(resp.statusCode == 200){
        resp.data["data"].forEach((item) {
          final UsuarioReqresModel temp =UsuarioReqresModel.fromMap(item);
          _datos.add(temp);
          dataStream.add(_datos);          
          result = true;
        });  

      }
     return result;
  }

  Future<UsuarioReqresModel> getUser(UsuarioReqresModel usuarioSeleccionado)async{
    late  UsuarioReqresModel result;    
    final resp = await _dio.get("$_urlBase/${usuarioSeleccionado.id}");   
     if(resp.statusCode == 200){
        result = UsuarioReqresModel.fromMap(resp.data["data"]);
      }
     return result;
  }

  Future<bool> putUser(int posicion)async{
    bool result = false;    
    final resp = await _dio.put("$_urlBase/${usuarioSeleccionado.id}",
                                data: usuarioSeleccionado.toJson());   
     if(resp.statusCode == 200){
        result = true;
        _datos.removeAt(posicion);
        _datos.insert(posicion, usuarioSeleccionado);
        dataStream.add(_datos);
      }
     return result;
  }

  Future<UsuarioReqresModel> postUser()async{
     late UsuarioReqresModel result;     
     final resp = await _dio.post(_urlBase,
                data: usuarioSeleccionado.toJson(),
                queryParameters: {"Content-Type":"application/json"});
      if(resp.statusCode == 201){      
        result = UsuarioReqresModel.fromMap(resp.data); 
        usuarioSeleccionado.id  = 22212;
        _datos.add(usuarioSeleccionado);
        dataStream.add(_datos);
      }
     return result;
  }

  Future<bool> deleteUserInIosOrAndroid(int posicion)async{
     bool result = false;         
      _datos.removeAt(posicion);
      dataStream.add(_datos);
       result = true; 
     return result;
  }

  List<UsuarioReqresModel> getData() => _datos;

  ServiceDioReqres._internal();
}