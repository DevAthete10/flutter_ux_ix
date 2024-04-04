import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_ux_ix/1.Presentation/bloc/contenido/contenido_bloc.dart';

class ListItemPage extends StatelessWidget {

  const ListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContenidoBloc, ContenidoState>(
      builder: (context, state) {    
        final items = state.itemSeleccionado.ejemplos;
        return Scaffold(
          appBar: AppBar(
            title: Text(state.itemSeleccionado.nombre),
          ),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final contenidoBloc = BlocProvider.of<ContenidoBloc>(context);
                  contenidoBloc.add(SeleccionarEjemploEvent(items[index]));
                  Navigator.pushNamed(context, items[index].routeApp);
                },
                child: ListTile(
                  title: Text(items[index].nombre),
                  leading: const Icon(Icons.accessible),
                  trailing: const Icon(
                    Icons.arrow_right,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
