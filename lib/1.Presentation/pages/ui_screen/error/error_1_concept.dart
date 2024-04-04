import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_ux_ix/1.Presentation/bloc/contenido/contenido_bloc.dart';

class Error1Page extends StatelessWidget {
  const Error1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ContenidoBloc, ContenidoState>(
      builder: (context, state) {
        return Scaffold(
            body: Column(
          children: [
            SizedBox(
              height: size.height * .55,
              child: imagen(state.ejemploSeleccionado.urlImage),
            ),
            SizedBox(
              height: size.height * .07,
              child: titulo(titulo: "Oops, Sorry!"),
            ),
            SizedBox(
              height: size.height * .2,
              child: subtitulo(
                  titulo:
                      """this product is mean for educational purpuse only. Any resemplance to near persons, living or dead is purely"""),
            ),
            SizedBox(
              height: size.height * .18,
              child: boton(
                context: context, 
                titulo: "Back", color: Colors.yellow, width: size.width*.5),
            ),
          ],
        ));
      },
    );
  }

  Widget titulo({required String titulo}) {
    return Text(
      titulo,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
    );
  }

  Widget subtitulo({required String titulo}) {
    return Text(
      titulo,
      style: const TextStyle(fontSize: 12),
      textAlign: TextAlign.center,
    );
  }

  Widget boton(
      {required BuildContext context,
      IconData icon = Icons.arrow_back,
      required String titulo,
      required Color color,
      required double width}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
        width: width,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              titulo,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget imagen(String image) {
    return Image.network(image, fit: BoxFit.cover,);
  }
}
