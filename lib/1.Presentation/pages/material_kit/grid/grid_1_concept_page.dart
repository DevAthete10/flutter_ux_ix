import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Grid1ConceptPage extends StatelessWidget {
  const Grid1ConceptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grid 1 Concept"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 100,
            mainAxisSpacing: 30,
            crossAxisSpacing: 10),
            itemCount: 21,                     
            itemBuilder: (context, index) {        
              return Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text("$index")),); 
            },  ),
      ),
    );
  }
}

