part of 'paginacion_bloc.dart';


@immutable
abstract class PaginacionEvent{}

class ActualizarPaginacionEvent extends PaginacionEvent {
 final int paginaSelecionada;
  ActualizarPaginacionEvent(this.paginaSelecionada); 
}
