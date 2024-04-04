import 'package:flutter/material.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/http/models/usuario_reqres_model.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/http/services/http_service_reqres.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/http/value_object/value_object.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
    final servicio = ServiceHttpReqres();

  @override
  Widget build(BuildContext context) {
    servicio.getUsers();
    return Scaffold(
        appBar: AppBar(title: const Text("HTTP"),
        leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: () {
          Navigator.pop(context);
        },),
        ),
        floatingActionButton: boton(context, servicio),
        body: StreamBuilder<List<UsuarioReqresModel>>(
                  initialData: servicio.getData(),
                  stream: servicio.dataStream.stream,
                  builder: (context, snapshot){
                    print("$snapshot -----------");
                    print("${servicio.dataStream.stream} -----------");
                      if(snapshot.hasData)
                      {return dataList(data: snapshot.data!,servicio: servicio,);}
                      return const CircularProgressIndicator();
                  }                      
                    )    
      );
  }

  FloatingActionButton boton(BuildContext context, ServiceHttpReqres servicio) {
    return FloatingActionButton(
        onPressed: (){
          servicio.usuarioSeleccionado = UsuarioReqresModel(
            id: 1222, 
            email: "", 
            firstName: "", 
            lastName: "", 
            avatar: "https://reqres.in/img/faces/1-image.jpg");
          show(
            context: context, 
            opciones: Opciones.crear, 
            servicio: servicio);          
        },
        child: const Icon(Icons.add),);
  }

  Future<dynamic> show({required BuildContext context,required ServiceHttpReqres servicio,required Opciones opciones, int posicion = 0}) {
    return showDialog(context: context, builder:(context) {
          List<String> items = ["Nombre", "Job"];       
             
          return SimpleDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("${(opciones == Opciones.crear) ? "Crear":"Editar"} usuario"),
                (opciones == Opciones.crear)
                ? Container()
                : IconButton(onPressed: (){
                  servicio.deleteUserInIosOrAndroid(posicion);
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
                      initialValue: (items[index] == "Nombre") 
                                      ?servicio.usuarioSeleccionado.firstName
                                      :servicio.usuarioSeleccionado.job,
                      onChanged: (value) =>
                       (items[index] == "Nombre")
                        ? servicio.usuarioSeleccionado.firstName = value
                        : servicio.usuarioSeleccionado.job = value,
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
                    ?servicio.postUser()
                    :servicio.putUser(posicion);
                  Navigator.pop(context);
                }, child: Text("Confirmar ${(opciones == Opciones.crear) ? "Creación":"Edición"}")),
              )     
            ],
          );
        },);
  }

  Widget dataList({required List<UsuarioReqresModel> data, required ServiceHttpReqres servicio}){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder:(context, index) {
      return GestureDetector(
        onTap: () {
          servicio.usuarioSeleccionado = data[index];
           show(
            context: context, 
            opciones: Opciones.editar, 
            servicio: servicio,
            posicion: index);                      
        },
        child: ListTile(
          title: Text(data[index].firstName),
          subtitle: Text(data[index].lastName),
          leading:  Image.network(data[index].avatar,height: 40,width: 40,fit: BoxFit.cover,),
          trailing: Text(data[index].email),),
      );
    },);
  }
}

