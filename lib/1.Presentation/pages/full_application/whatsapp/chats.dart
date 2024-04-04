
import 'package:flutter/material.dart';

class ChatsView extends StatelessWidget {

  final int length;
  final String image;

  const ChatsView(
    {super.key, 
    required this.length, 
    required this.image});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: length,
      itemBuilder: (context, index) => ListTile(
        title: const Text("Title",
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.bold,
              color: Colors.white)),
        subtitle: Row(
          children: [
            (index == 3)
            ? const Icon(Icons.check, color: Colors.grey,)
            : const Icon(Icons.call, color: Colors.red,),
            const SizedBox(width: 2,),
            Text(
              (index == 3) ? "Hola" :"Llamada perdida",
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        leading: ClipOval(
          child: Image.network(            
            image,
            fit: BoxFit.cover,
            height: 50,
            width: 50,
        )),
        trailing:  Text(
          (index > 2) ? "0${index+1}-02-2024" :"Ayer",
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ),
    );
  }
}