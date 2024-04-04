part of 'paginacion_bloc.dart';


abstract class PaginacionState {
 int paginacion;

   PaginacionState({required this.paginacion});

}

class PaginacionInitialState extends PaginacionState {
   PaginacionInitialState({required int paginacion}): super(paginacion: paginacion);
}
class PaginacionUpdatedState extends PaginacionState {
   PaginacionUpdatedState({required int paginacion}): super(paginacion: paginacion);
}
