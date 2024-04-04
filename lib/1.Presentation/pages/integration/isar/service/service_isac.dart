import 'dart:async';

import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/isar/db/isac_local.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/isar/models/nota.dart';


class ServiceIsar {
  
  final IsarLocal _db = IsarLocal.db; 
  List<NotaModel> _notas = [];
  NotaModel? notaSeleccionada;
  Future<bool> getNotas()async{
    bool result = false;
     final data =  await _db.getAll();
     _notas = [...data];
    _db.notasStream.add(_notas);
     result = true;
     return result; 
  }

  Future<bool> createNota()async{
    bool result = false;
    await _db.create(notaSeleccionada!);    
    _notas.add(notaSeleccionada!);
    _db.notasStream.add(_notas);
    result = true;
    return result;
  }
  Future<bool> updateNota()async{
    bool result = false;
    final resp = await _db.update(notaSeleccionada!);    
    if (resp) {
    final posicion = _notas.indexWhere((nota) =>  nota.isarId == notaSeleccionada!.isarId!);
    _notas[posicion] = notaSeleccionada!;
    _db.notasStream.add(_notas);
    result = true;      
    }
    return result;
  }
  Future<bool> deleteNota()async{
    bool result = false;
    final resp = await _db.deleteNota(notaSeleccionada!.isarId!);    
    final posicion = _notas.indexWhere((nota) =>  nota.isarId == notaSeleccionada!.isarId!);
    _notas.removeAt(posicion);
    _db.notasStream.add(_notas);
    result = resp;
    return result;
  }

  Future<bool> watchDB()async{
    await _db.watchDB();    
    return true;
  }

  Stream<List<NotaModel>>dataaa() =>_db.notasStream.stream;     


}