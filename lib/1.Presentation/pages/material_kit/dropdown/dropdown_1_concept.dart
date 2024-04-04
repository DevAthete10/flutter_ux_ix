import 'package:flutter/material.dart';

class DropDown1ConceptPage extends StatefulWidget {
  const DropDown1ConceptPage({super.key});

  @override
  State<DropDown1ConceptPage> createState() => _DropDown1ConceptPageState();
}

class _DropDown1ConceptPageState extends State<DropDown1ConceptPage> {
  String selectItem = "Pinner";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("DropdownButton"),),
      body: Center(
        child: DropdownButton<String>(
        value: selectItem,
        items: const [
            DropdownMenuItem<String>(
              value: "Pinner",
              child: Text("Pinner")),
            DropdownMenuItem<String>(
              value: "Floating",
              child: Text("Floating")),
        ], onChanged: (String? value) {
              setState(() {
                selectItem = value.toString();
              });
          },),
      ),
    );
  }
}