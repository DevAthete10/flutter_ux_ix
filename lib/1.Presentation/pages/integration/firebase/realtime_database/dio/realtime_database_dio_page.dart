import 'package:flutter/material.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/firebase/realtime_database/dio/dio_service_realtime_database.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/firebase/realtime_database/dio/nota_model.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/sqflite/value_object/value_object.dart';

class RealtimeDatabaseDioPage extends StatefulWidget {
  const RealtimeDatabaseDioPage({super.key});

  @override
  State<RealtimeDatabaseDioPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<RealtimeDatabaseDioPage> {
    final ServiceDioRealtimeDatabase servicio = ServiceDioRealtimeDatabase();
    
    @override
  void initState() {   
    servicio.getNotas();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Realtime Database + Dio"),
        leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: () {
          Navigator.pop(context);
        },),
        ),
        floatingActionButton: boton(context, servicio),
        body: StreamBuilder<List<NotaModel>>(
                  initialData: servicio.getData(),
                  stream: servicio.notasStream.stream,
                  builder: (context, snapshot){
                      if(snapshot.hasData)
                      {return dataList(data: snapshot.data!,);}
                      return const CircularProgressIndicator();
                  }                      
                    )    
      );
  }

  FloatingActionButton boton(BuildContext context, ServiceDioRealtimeDatabase servicio) {
    return FloatingActionButton(
        onPressed: (){
          servicio.notaSeleccionada = NotaModel(
            titulo: "", 
            descripcion: "",);
         show(context: context, opciones: Opciones.crear);
        },
        child: const Icon(Icons.add),);
  }

  Future<dynamic> show({required BuildContext context,required Opciones opciones, int posicion = 0}) {
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
                  servicio.deleteNotaInIosOrAndroid();              
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
                    ?servicio.postNota()
                    :servicio.putNota();
                  Navigator.pop(context);
                }, child: Text("Confirmar ${(opciones == Opciones.crear) ? "Creación":"Edición"}")),
              )     
            ],
          );
        },);
  }

  Widget dataList({required List<NotaModel> data}){
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

