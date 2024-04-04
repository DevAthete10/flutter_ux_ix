
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/http/models/usuario_reqres_model.dart';

class ServiceHttpReqres {
  

  static final ServiceHttpReqres _singleton =  ServiceHttpReqres._internal();
  final String _urlBase = "reqres.in"; 
  List<UsuarioReqresModel> _datos = [];
  final dataStream = StreamController<List<UsuarioReqresModel>>.broadcast();
  late UsuarioReqresModel usuarioSeleccionado;

    factory ServiceHttpReqres() {
    return _singleton;
  }

  Future<bool> getUsers()async{
    bool result = false; 
    if (_datos.isNotEmpty) {
      result = true;      
      return result;
    }
     Uri url = Uri.https(_urlBase,"/api/users",{
      "per_page":"5",
      });
     final resp = await http.get(url);
      if(resp.statusCode == 200){
        Map<String, dynamic> body = await json.decode(resp.body); 
        body["data"].forEach((item) {
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
    Uri url = Uri.https(_urlBase,"/api/users/${usuarioSeleccionado.id}");
    final resp = await http.get(url);   
     if(resp.statusCode == 200){
        Map<String, dynamic> body = await json.decode(resp.body); 
        result = UsuarioReqresModel.fromMap(body["data"]);
      }
     return result;
  }

  Future<bool> putUser(int posicion)async{
    bool result = false;
    Uri url = Uri.https(_urlBase,"/api/users/${usuarioSeleccionado.id}");
    final resp = await http.put(url,body: usuarioSeleccionado.toJson());   
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
     Uri url = Uri.https(_urlBase,"/api/users");
     final resp = await http.post(url,body: usuarioSeleccionado.toJson(),headers: {
      "Content-Type":"application/json"
     });
      if(resp.statusCode == 201){      
        Map<String, dynamic> body = await json.decode(resp.body); 
        result = UsuarioReqresModel.fromMap(body); 
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


  ServiceHttpReqres._internal();
}