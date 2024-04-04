import 'package:flutter/material.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/http/services/http_service_reqres.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/sqflite/value_object/value_object.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/sqflite/models/nota_model.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/sqflite/service/service_sqflite.dart';

class SqlitePage extends StatefulWidget {
  const SqlitePage({super.key});

  @override
  State<SqlitePage> createState() => _HttpPageState();
}

class _HttpPageState extends State<SqlitePage> {
    final servicio = ServiceHttpReqres();
    final ServiceSqflite sq = ServiceSqflite();
    
    @override
  void initState() {
    sq.getNotas();
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("datos actuales ${sq.notas()}");
    return Scaffold(
        appBar: AppBar(title: const Text("Todo SqFlite"),
        leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: () {
          Navigator.pop(context);
        },),
        ),
        floatingActionButton: boton(context, sq),
        body: StreamBuilder<List<NotaModel>>(
                  initialData: sq.notas(),
                  stream: sq.notasStream.stream,
                  builder: (context, snapshot){
                      if(snapshot.hasData)
                      {return dataList(data: snapshot.data!,servicio: sq,);}
                      return const CircularProgressIndicator();
                  }                      
                    )    
      );
  }

  FloatingActionButton boton(BuildContext context, ServiceSqflite servicio) {
    return FloatingActionButton(
        onPressed: (){
          servicio.notaSeleccionada = NotaModel(
            titulo: "", 
            descripcion: "",);
         show(context: context, servicio: servicio, opciones: Opciones.crear);
        },
        child: const Icon(Icons.add),);
  }

  Future<dynamic> show({required BuildContext context,required ServiceSqflite servicio,required Opciones opciones, int posicion = 0}) {
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
                  servicio.deleteNota(servicio.notaSeleccionada!.id!);              
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
                    ?servicio.createNota(servicio.notaSeleccionada!)
                    :servicio.updateNota(servicio.notaSeleccionada!);
                  Navigator.pop(context);
                }, child: Text("Confirmar ${(opciones == Opciones.crear) ? "Creación":"Edición"}")),
              )     
            ],
          );
        },);
  }

  Widget dataList({required List<NotaModel> data, required ServiceSqflite servicio}){
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
            servicio: sq,
            posicion: index);                      
        },
        child: ListTile(
          title: Text(data[index].titulo),
          subtitle: Text(data[index].descripcion),          
          trailing: Text(data[index].id.toString()),),
      );
    },);
  }
}

