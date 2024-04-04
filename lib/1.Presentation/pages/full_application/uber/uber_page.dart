import 'package:flutter/material.dart';

class UberPage extends StatelessWidget {
  const UberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(color: Colors.red,child: Text("Uber"),),
    );
  }
}