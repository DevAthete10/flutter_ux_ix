import 'package:flutter/material.dart';

class DrawerAnimationPage extends StatelessWidget {
  const DrawerAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(color: Colors.red,child: Text("Drawer animation"),),
    );
  }
}