part of 'contenido_bloc.dart';


abstract class ContenidoState {
   ContenidosViewModel contenidos;
   List? contenido;
   List<String> nombres;
   ContenidoViewModel itemSeleccionado;
   Ejemplo ejemploSeleccionado;

   ContenidoState({
    required this.contenidos, 
    required this.nombres,
    required this.contenido,
    required this.itemSeleccionado,
    required this.ejemploSeleccionado
    });
}

class ContenidoInitialState extends ContenidoState {
   ContenidoInitialState({
    required ContenidosViewModel contenidos,
    required List<String> nombres, 
    required List? contenido,
    required ContenidoViewModel itemSeleccionado,
    required Ejemplo ejemploSeleccionado
    })
    : super(
      contenidos: contenidos, 
      nombres: nombres, 
      contenido: contenido,
      itemSeleccionado: itemSeleccionado,
      ejemploSeleccionado: ejemploSeleccionado
      );
}
class ContenidoUpdatedState extends ContenidoState {
   ContenidoUpdatedState({
   required ContenidosViewModel contenidos,
    required List<String> nombres, 
    required List? contenido,
    required ContenidoViewModel itemSeleccionado,
    required Ejemplo ejemploSeleccionado
    })
    : super(
      contenidos: contenidos, 
      nombres: nombres, 
      contenido: contenido,
      itemSeleccionado: itemSeleccionado,
      ejemploSeleccionado: ejemploSeleccionado
      );
}
class ContenidosGetState extends ContenidoState {
   ContenidosGetState({
    required ContenidosViewModel contenidos,
    required List<String> nombres, 
    required List? contenido,
    required ContenidoViewModel itemSeleccionado,
        required Ejemplo ejemploSeleccionado
    })
    : super(
      contenidos: contenidos, 
      nombres: nombres, 
      contenido: contenido,
      itemSeleccionado: itemSeleccionado,
      ejemploSeleccionado: ejemploSeleccionado
      );
}
