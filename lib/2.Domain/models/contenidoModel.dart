import 'package:flutter_full_ux_ix/3.DataAccess/contracts/da_contenido_contract.dart';
import 'package:flutter_full_ux_ix/3.DataAccess/repositories/contenido_impl.dart';

class ContenidoModel {

   late ContenidoContract _contenidosImpl;

  ContenidoModel(){
    _contenidosImpl = ContenidoImpl();
  }

  Map<String, List> getAll() => _contenidosImpl.getAll();

  List<String> getNombres() => _contenidosImpl.getNombres();

  List? selecionarContenido(int paginaSeleccionada){
    late List? data; 
      switch (paginaSeleccionada) {
              case 0:
                data = getAll()[getNombres()[0]];
                break;
              case 1:
                data = getAll()[getNombres()[1]];
                break;
              case 2:
                data = getAll()[getNombres()[2]];
                break;
              case 3:
                data = getAll()[getNombres()[3]];
                break;
              case 4:
                data = getAll()[getNombres()[4]];
                break;
              default:
            }      
            return data;
  }

}