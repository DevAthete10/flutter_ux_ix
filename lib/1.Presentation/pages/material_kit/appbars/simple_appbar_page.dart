import 'package:flutter/material.dart';

class SimpleAppBarPage extends StatelessWidget {
  const SimpleAppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple AppBar"),),
    );
  }
}