import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_ux_ix/1.Presentation/view_models/view_models.dart';
import '../bloc/paginacion/paginacion_bloc.dart';
import '../bloc/contenido/contenido_bloc.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {    
    final paginacionBloc = BlocProvider.of<PaginacionBloc>(context);
    final contenidoBloc = BlocProvider.of<ContenidoBloc>(context);
    return BlocBuilder<ContenidoBloc, ContenidoState>(
      builder: (context, statecontenido) {             
        return BlocBuilder<PaginacionBloc, PaginacionState>(
          builder: (context, state) {          
            return Scaffold(
              appBar: AppBar(
                title: Text(statecontenido.nombres[state.paginacion]),
              ),
              body: ListView.builder(
                    itemCount: statecontenido.contenido!.length,
                    itemBuilder: (context, index) {                    
                      return GestureDetector(
                        onTap: () {
                          contenidoBloc.add(SeleccionarItemEvent(ContenidoViewModel.fromMap(statecontenido.contenido![index])));  
                          Navigator.pushNamed(
                              context,
                              statecontenido.contenido![index]["route_app"]);
                        },
                        child: ListTile(
                          title: Text(statecontenido.contenido![index]["nombre"]),
                          leading: const Icon(Icons.link),
                          trailing: const Icon(
                            Icons.arrow_right,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (value) {
                    contenidoBloc.add(SeleccionarContenidosEvent(value));
                    paginacionBloc.add(ActualizarPaginacionEvent(value));
                  },
                  currentIndex: state.paginacion,
                  unselectedItemColor: Colors.black,
                  fixedColor: Colors.red,
                  items: List.generate(statecontenido.nombres.length, (index) {
                    final nombre = statecontenido.nombres[index].toString().split("_");
                    return BottomNavigationBarItem(
                        icon: const Icon(Icons.add),
                        label: "${nombre.first} ${nombre.last}");
                  })),
            );
          },
        );
      },
    );
  }
}
