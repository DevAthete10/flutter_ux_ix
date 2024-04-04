

import 'package:flutter/material.dart';

class SliverAppBarPage extends StatelessWidget {
  const SliverAppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           const SliverAppBar(
            title: Text("SliverAppBar"),
            expandedHeight: 300,
            backgroundColor: Colors.red,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("data"),
              background: Text(" data 3"),
            ),
            // stretch: true,
            // snap: true,
            // floating: true,            
            ),                 
          SliverList.builder(       
            itemCount: 40,
            itemBuilder:(context, index) {
            return ListTile(title: Text("item ${index+1}"),);
          },)
        ],
      ),
    );
  }
}