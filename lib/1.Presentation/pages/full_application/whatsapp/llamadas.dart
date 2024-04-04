

import 'package:flutter/material.dart';

class LlamadasView extends StatelessWidget {
  final String image;
  const LlamadasView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    Color colorIcon = const Color.fromRGBO(0, 168, 132, 10);
    return Padding(
    padding: const EdgeInsets.all(10),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: colorIcon,                      
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: const Icon(Icons.link, color: Colors.black,)),
                  const SizedBox(width: 15,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Crear enlace de llamada", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                      SizedBox(
                        width: 250,
                        child: Text("""Comparte un enlace para tu llamada de WhatsApp""", style: TextStyle(color: Colors.grey),),
                      )
                    ],
                  )  
                ],
              ),        
          const SizedBox(height: 10,),
           Text("Recientes", style: TextStyle(color: Colors.white.withOpacity(.9)),),  
          const SizedBox(height: 20,),
          ListView.builder(
            itemCount: 25,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder:(context, index) {
              return  Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [
                     ClipOval(
                      child: Image.network(image, fit: BoxFit.cover,height: 50, width: 50,),
                      ),                  
                     const SizedBox(width: 15,),
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text((index > 4) ? "Mamá":"TEAM 250.000 SEMANA...", style: TextStyle(color: (index == 3)? Colors.red:Colors.white.withOpacity(.9), fontSize: 18),),
                        Row(
                          children: [
                            (index == 3)
                            ? const Icon(Icons.call_received, color:  Color.fromARGB(255, 237, 29, 14),size: 18)
                            : const Icon(Icons.call_made, color:  Color.fromARGB(255, 69, 255, 75),size: 18),
                            const SizedBox(width: 5,),
                            const Text("Hoy, 11:56 a.m.", style: TextStyle(color: Colors.grey),),
                          ],
                        )
                      ],
                     ),
                     const Spacer(),  
                      (index == 3)           
                     ?  Icon(Icons.phone, color: colorIcon,)
                     :  Icon(Icons.videocam, color: colorIcon),
                     const SizedBox(width: 10,)
                  ],
                ),
              );
            },),  
        ],
      ),
    ),
  );
  }
}