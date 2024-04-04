

import 'package:flutter_full_ux_ix/3.DataAccess/entities/contenidos_entities.dart';

interface class ContenidoContract {
  add(ContenidosEntities contenidos){}
  update(ContenidosEntities contenidos){}
  getAll(){}
  getNombres(){}
  delete(ContenidosEntities contenidos){}
}