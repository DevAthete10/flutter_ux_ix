import 'package:flutter/material.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/isar/models/nota.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/isar/service/service_isac.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/sqflite/value_object/value_object.dart';

class IsarPage extends StatefulWidget {
  const IsarPage({super.key});

  @override
  State<IsarPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<IsarPage> {
    final ServiceIsar service = ServiceIsar();
    
    @override
  void initState() {
    service.getNotas();
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    service.watchDB();
    return Scaffold(
        appBar: AppBar(title: const Text("Notas Isar"),
        leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: () {
          Navigator.pop(context);
        },),
        ),
        floatingActionButton: boton(context, service),
        body: StreamBuilder<List<NotaModel>>(
                  stream: service.dataaa(),
                  builder: (context, snapshot){
                      if(snapshot.hasData)
                      {return dataList(data: snapshot.data!,servicio: service,);}
                      return const CircularProgressIndicator();
                  }                      
                    )    
      );
  }

  FloatingActionButton boton(BuildContext context, ServiceIsar servicio) {
    return FloatingActionButton(
        onPressed: (){
          servicio.notaSeleccionada = NotaModel(
            titulo: "", 
            descripcion: "",);
         show(context: context, servicio: servicio, opciones: Opciones.crear);
        },
        child: const Icon(Icons.add),);
  }

  Future<dynamic> show({required BuildContext context,required ServiceIsar servicio,required Opciones opciones, int posicion = 0}) {
    return showDialog(context: context, builder:(context) {
          List<String> items = ["Titulo", "Descripción"];                 
          return SimpleDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("${(opciones == Opciones.crear) ? "Crear":"Editar"} nota"),
                (opciones == Opciones.crear)
                ? Container()
                : IconButton(onPressed: (){              
                  servicio.deleteNota();              
                  Navigator.pop(context);
                }, icon:const  Icon(Icons.delete))
              ],
            ),
            children: [                  
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:items.length,
                  itemBuilder:(context, index) {
                    return TextFormField(                      
                      initialValue: (items[index] == "Titulo") 
                                      ?servicio.notaSeleccionada!.titulo
                                      :servicio.notaSeleccionada!.descripcion,
                      onChanged: (value) =>
                       (items[index] == "Titulo")
                        ? servicio.notaSeleccionada!.titulo = value
                        : servicio.notaSeleccionada!.descripcion = value,
                      decoration: InputDecoration(
                            labelText: items[index],                                
                        ),
                    );
                  },),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: (){
                  (opciones == Opciones.crear)
                    ?servicio.createNota()
                    :servicio.updateNota();
                  Navigator.pop(context);
                }, child: Text("Confirmar ${(opciones == Opciones.crear) ? "Creación":"Edición"}")),
              )     
            ],
          );
        },);
  }

  Widget dataList({required List<NotaModel> data, required ServiceIsar servicio}){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder:(context, index) {
      return GestureDetector(
        onTap: () {
        servicio.notaSeleccionada = data[index];
           show(
            context: context, 
            opciones: Opciones.editar, 
            servicio: service,
            posicion: index);                      
        },
        child: ListTile(
          title: Text(data[index].titulo),
          subtitle: Text(data[index].descripcion),          
          trailing: Text(data[index].isarId.toString()),),
      );
    },);
  }
}

