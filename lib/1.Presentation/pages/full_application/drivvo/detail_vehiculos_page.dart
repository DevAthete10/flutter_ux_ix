import 'package:flutter/material.dart';

class DetailVehiculoPage extends StatelessWidget {
  const DetailVehiculoPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> _opciones = ["Fecha","Odómetro","Tipo de servicio","Locación","Notas"];
    List<IconData> _iconos = [Icons.calendar_month,Icons.add,Icons.miscellaneous_services_outlined,Icons.location_on,Icons.note_sharp];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Car"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.check))
          ],),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ListView.builder(
              itemCount: _opciones.length,
              shrinkWrap: true,
              itemBuilder:(context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(              
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: _opciones[index],
                      icon: Icon(_iconos[index])
                    ),
                  )),
              ) ;
            },)
          ],
        ),
      ),
    );
  }
}