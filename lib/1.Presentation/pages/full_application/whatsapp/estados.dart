import 'package:flutter/material.dart';

class EstadosView extends StatelessWidget {
  final String image;
  const EstadosView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(10),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                       ClipOval(
                        child: Image.network(image, height: 50, width: 50,),
                       ),
                       Positioned(
                         right: -3,
                         bottom:-2,
                         child: Container(
                          height:30,
                          width:30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 4, color: Colors.black)
                            ),   
                          child: const Icon(Icons.add_circle, color: Colors.green,size: 25,),
                         ),
                       )  
                    ],
                  ),
                    const SizedBox(width: 15,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mi estado", style: TextStyle(color: Colors.white, fontSize: 18),),
                      Text("Añade una actualización", style: TextStyle(color: Colors.grey),)
                    ],
                  )  
                ],
              ),
          const Text("Recientes", style: TextStyle(color: Colors.grey),),  
          const SizedBox(height: 10,),
          ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder:(context, index) {
              return  Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                     estadosClientes(estados: 4),                   
                     const SizedBox(width: 15,),
                     const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("WWE", style: TextStyle(color: Colors.white, fontSize: 18),),
                        Text("Hoy, 11:56 a.m.", style: TextStyle(color: Colors.grey),)
                      ],
                    )  
                  ],
                ),
              );
            },),  
        ],
      ),
    ),
  );
  }
  estadosClientes({int estados = 0}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 3, color: Colors.green)
      ),
      child: ClipOval(
        child: Image.network(image, height: 50, width: 50,),
      ),
    );
  }
}