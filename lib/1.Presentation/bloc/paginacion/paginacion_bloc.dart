import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'paginacion_event.dart';
part 'paginacion_state.dart';


class PaginacionBloc extends Bloc<PaginacionEvent,PaginacionState> {
  PaginacionBloc(): super( PaginacionInitialState(paginacion: 0)){
    on<ActualizarPaginacionEvent>(_actualizarPaginado);

  }

  void _actualizarPaginado(ActualizarPaginacionEvent event, Emitter<PaginacionState> emit) {  
    state.paginacion = event.paginaSelecionada;
    emit(PaginacionUpdatedState(paginacion: state.paginacion));
  }

}
