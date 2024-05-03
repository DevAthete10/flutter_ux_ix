import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_full_ux_ix/1.Presentation/view_models/view_models.dart';
import 'package:flutter_full_ux_ix/2.Domain/models/contenidoModel.dart';

part 'contenido_event.dart';
part 'contenido_state.dart';


class ContenidoBloc extends Bloc<ContenidoEvent,ContenidoState> {
  static Map<String, dynamic> contenidos = ContenidoModel().getAll();
  static List<String> nombres = ContenidoModel().getNombres();
  static List? contenido = ContenidoModel().selecionarContenido(0);
  static ContenidoViewModel contenidoItem = ContenidoViewModel(ejemplos: [],nombre: "",routeApp: "", urlImage: ''); 
  static Ejemplo ejemploItem = Ejemplo(nombre: '', routeApp: '', urlImage: ''); 
  ContenidoBloc(): super( ContenidoInitialState(
    contenidos: ContenidosViewModel.fromMap(contenidos),
    nombres: nombres,
    contenido: contenido, 
    itemSeleccionado: contenidoItem, ejemploSeleccionado: ejemploItem)){

    on<SeleccionarContenidosEvent>(_seleccionarContenido);
    on<SeleccionarItemEvent>(_seleccionarItem);
    on<SeleccionarEjemploEvent>(_seleccionarEjemplo);

  }

  void _seleccionarContenido(SeleccionarContenidosEvent event, Emitter<ContenidoState> emit) {  
    
    state.contenido = ContenidoModel().selecionarContenido(event.pagina);

    emit(ContenidoUpdatedState(
      contenidos: state.contenidos,
       nombres: state.nombres,
       contenido: state.contenido, 
       itemSeleccionado: contenidoItem,
       ejemploSeleccionado: ejemploItem));
  }
  void _seleccionarItem(SeleccionarItemEvent event, Emitter<ContenidoState> emit) {  
    
    state.itemSeleccionado = event.itemSeleccionado;

    emit(ContenidoUpdatedState(
      contenidos: state.contenidos,
       nombres: state.nombres,
       contenido: state.contenido, 
       itemSeleccionado: state.itemSeleccionado, 
       ejemploSeleccionado: state.ejemploSeleccionado));
  }
  void _seleccionarEjemplo(SeleccionarEjemploEvent event, Emitter<ContenidoState> emit) {  
    
    state.ejemploSeleccionado = event.ejemploSeleccionado;

    emit(ContenidoUpdatedState(
      contenidos: state.contenidos,
       nombres: state.nombres,
       contenido: state.contenido, 
       itemSeleccionado: state.itemSeleccionado, 
       ejemploSeleccionado: state.ejemploSeleccionado));
  }

}
