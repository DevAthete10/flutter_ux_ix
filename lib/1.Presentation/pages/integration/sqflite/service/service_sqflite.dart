import 'dart:async';

import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/sqflite/db/db_sqflite.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/sqflite/models/nota_model.dart';

class ServiceSqflite {
  
  final DBSqlite _db = DBSqlite.db; 
  List<NotaModel> _notas = [];
  NotaModel? notaSeleccionada;
  final StreamController<List<NotaModel>> notasStream = StreamController<List<NotaModel>>.broadcast();
  Future<bool> getNotas()async{
    bool result = false;
     final data =  await _db.getNotas();
     _notas = [...data];
     notasStream.add(_notas);
     result = true;
     print(_notas);
     return result; 
  }

  Future<bool> createNota(NotaModel nota)async{
    bool result = false;
    final id = await _db.nuevoNota(nota);    
    nota.id = id;
    _notas.add(nota);
    notasStream.add(_notas);
    result = true;
    return result;
  }
  Future<bool> updateNota(NotaModel notaModificada)async{
    bool result = false;
    await _db.updateNota(notaModificada);    
    final posicion = _notas.indexWhere((nota) =>  nota.id == notaModificada.id);
    _notas[posicion] = notaModificada;
    notasStream.add(_notas);
    result = true;
    return result;
  }
  Future<bool> deleteNota(int id)async{
    bool result = false;
    await _db.deleteNota(id);    
    final posicion = _notas.indexWhere((nota) =>  nota.id == id);
    _notas.removeAt(posicion);
    notasStream.add(_notas);
    result = true;
    return result;
  }

  List<NotaModel> notas() => _notas;

}