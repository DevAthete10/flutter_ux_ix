import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_ux_ix/1.Presentation/bloc/contenido/contenido_bloc.dart';

class List1ConceptPage extends StatelessWidget {
  const List1ConceptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContenidoBloc, ContenidoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Concepto 1 List"),
          ),
          body: ListView.builder(
            itemCount: 8,
            itemBuilder:(context, index) {
              return cardItem(titulo: "Título ${index + 1}", subtitulo: "Subtitulo de la lista ${index + 1}", image: state.itemSeleccionado.urlImage);
            }),
        );
      },
    );
  }
  
  Widget cardItem({required String titulo,required String subtitulo,required String image,}){
    return Container(
      padding: const EdgeInsets.all(5),
      margin:const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38, 
            blurRadius: 4, 
            blurStyle: BlurStyle.solid
            )
            ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(titulo, style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
               Text(subtitulo, style: const TextStyle(
                color: Colors.black, fontSize: 10),),
            ],
          ),
          imagen(image)  
        ],
      ),
    );
  }
  
  Widget imagen(String image){
    return SizedBox(
      height: 50,
      width: 75,
      child: Opacity(
        opacity: 0.75,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipOval(
                child: Image.network(
                  image,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,),
              ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.facebook, color: Colors.black,))  
          ],
        ),
      ),
    );
  }
}