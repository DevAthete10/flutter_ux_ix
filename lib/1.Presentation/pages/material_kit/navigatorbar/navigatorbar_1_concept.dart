import 'package:flutter/material.dart';

class NavigatorBar1ConceptPage extends StatelessWidget {
  const NavigatorBar1ConceptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NavigatorBar Concept 1"),),
      body: Container(color: Colors.red,),
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(2, (index) => BottomNavigationBarItem(
          icon: const Icon(Icons.add), 
          label: "Item ${index+1}"))),
    );
  }
}