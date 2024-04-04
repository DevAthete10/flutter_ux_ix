import 'package:flutter/material.dart';

class NovedadesView extends StatelessWidget {
  const NovedadesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(15.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Haz crecer tu empresa", style: TextStyle(color: Colors.white),),
          Container(
            padding:const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.green.withGreen(2),
                    borderRadius: BorderRadius.circular(60)
                  ),
                  child: const Icon(Icons.volume_up, color: Colors.green,)
                  ),
                const Text("Crea tu primer anuncio", style: TextStyle(color: Colors.white, fontSize: 20),),
                const Text("Llega a nuevos clientes en Facebook e Instagram con anuncios que dirigen a WhatsApp",style: TextStyle(color: Colors.white),),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Center(child: Text("Comenzar", style: TextStyle(color: Colors.red))),),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          const Text("Herramientas para la empresa", style: TextStyle(color: Colors.white),),
          ListView.builder(
            itemCount: 20,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder:(context, index) {
            return const Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.store, color: Colors.grey,),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Perfil de empresa", style: TextStyle(color: Colors.white),),
                      Text("Edita la dirección, los horarios y sitios web", style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
                
              ],
            );
          },)
        ],
      ),
    ),
  );
  }
}