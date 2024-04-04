import 'package:flutter/material.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/google_sign/services/google_sign_service.dart';

class GoogleSignPage extends StatefulWidget {
  const GoogleSignPage({super.key});


  @override
  State<GoogleSignPage> createState() => _GoogleSignPageState();
}

class _GoogleSignPageState extends State<GoogleSignPage> {
  bool isSignGoogle = true;
  final service = GoogleSignService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Google Sign"),
        actions: [
          IconButton(
            onPressed: (){
              showDialog(
                context: context, 
                builder:(context) {
                  return const SimpleDialog(
                    contentPadding: EdgeInsets.all(10),
                    title: Text("Cómo ejecutar el package a fecha de 2024-04-04"),
                    children: [                    
                      Text("Paso 1.1: Agregar Firebase al proyecto de flutter"),
                      Text("Paso 1.2: Activar Authentication/Activar acceso con google"),
                      Text("Paso 1.3: Unir la BD de firebase con el proyecto de flutter"),                      
                      Text("Paso 1.4: Cambiar el nombre del proyecto de flutter para que sea único y así evitar problemas en AppStore"),                      
                      Text("Paso 2.1: Agregar El proyecto de Firebase a Google Cloud"),                      
                      Text("Paso 2.2: Configurar el OAuth consent screen"),                      
                    ],
                  );
                },);
            }, 
            icon: const Icon(Icons.info_outline))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Column(
              children: [
                Text("Nombre: ${service.usuarioSelect.nombre}", style:const TextStyle(fontWeight: FontWeight.bold),),
                Text("Correo: ${service.usuarioSelect.correo}"),
              ],
            ),
            (service.usuarioSelect.photoUrl == null || service.usuarioSelect.photoUrl == "")
            ? Container()
            : ClipOval(
              child: Image.network("${service.usuarioSelect.photoUrl}",width: 50,height: 50,))
          ],),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.yellow)
              ),
              onPressed: ()async{
               (isSignGoogle)? await service.signGoogle():await service.signOutGoogle();
                  
                final bool respIsSignGoogle = await service.boolGoogle();          
                setState(() {
                  isSignGoogle = !respIsSignGoogle;                
                });            
              }, 
              child: Text( (isSignGoogle)?"Sign Google":"SignOut Google")),
          ),
        ],
      ),
    );
  }
}
