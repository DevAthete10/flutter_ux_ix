import 'package:flutter/material.dart';

class Grid2ConceptPage extends StatelessWidget {
  const Grid2ConceptPage({super.key});

  @override
  Widget build(BuildContext context) {
    int posicion = 1;
    return Scaffold(
      appBar: AppBar(title: const Text("Grid 2 Concept"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 100,
            mainAxisSpacing: 30,
            crossAxisSpacing: 10),
            itemCount: 21,                     
            itemBuilder: (context, index) {               
               if(posicion < index){posicion = posicion+3;}
              return Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)
                ),
                transform: Matrix4.translationValues(0,(posicion != index) ?15:0, 0),
                child: Center(child: Text("$index")),); 
            },  ),
      ),
    );
  }
}

