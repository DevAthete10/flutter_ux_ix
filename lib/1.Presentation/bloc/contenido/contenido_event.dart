part of 'contenido_bloc.dart';


@immutable
abstract class ContenidoEvent{}

class ActualizarContenidoEvent extends ContenidoEvent {
  ActualizarContenidoEvent(); 
}
class SeleccionarContenidosEvent extends ContenidoEvent {
  final int pagina;
 SeleccionarContenidosEvent(
   this.pagina);
}
class SeleccionarItemEvent extends ContenidoEvent {
 final ContenidoViewModel itemSeleccionado;
 SeleccionarItemEvent(
   this.itemSeleccionado);
}
class SeleccionarEjemploEvent extends ContenidoEvent {
 final Ejemplo ejemploSeleccionado;
 SeleccionarEjemploEvent(
   this.ejemploSeleccionado);
}
