import 'package:flutter_full_ux_ix/3.DataAccess/contracts/da_contenido_contract.dart';
import 'package:flutter_full_ux_ix/3.DataAccess/entities/entities.dart';
import 'package:flutter_full_ux_ix/db/dbPrueba.dart';

class ContenidoImpl implements ContenidoContract {
  @override
  Map<String, List> getAll() => data;
  
  @override
  List<String> getNombres() =>  getAll().keys.toList();
  
  @override
  add(ContenidosEntities contenidos) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  delete(ContenidosEntities contenidos) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  update(ContenidosEntities contenidos) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
}