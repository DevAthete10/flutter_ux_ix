import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/video_image/services/image_picker_service.dart';
import 'package:video_player/video_player.dart';

class VideoImagePickerPage extends StatefulWidget {
  const VideoImagePickerPage({super.key});
  

  @override
  State<VideoImagePickerPage> createState() => _VideoImagePickerPageState();
}

class _VideoImagePickerPageState extends State<VideoImagePickerPage> {
  final ImagePickerService service = ImagePickerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Video_ player + Image_picker"),
        actions: [
          IconButton(onPressed: ()async{
            await service.capturePhoto();
            setState(() {
              
            });
          }, icon: const Icon(Icons.camera_alt)),
          IconButton(onPressed: ()async{
            await service.pickPhoto();
            setState(() {
              
            });
          }, icon: const Icon(Icons.image)),
          IconButton(onPressed: ()async{
            await service.captureVideo();
            await service.controllerVideoCapture();            
            setState(() {
              
            });
          }, icon: const Icon(Icons.video_camera_back_outlined)),
          IconButton(onPressed: ()async{
            await service.pickVideo();
            await service.controllerVideoPick();
            setState(() {
            });
          }, icon: const Icon(Icons.video_collection_outlined)),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text("Imagen Capturada"),
                    Container(
                      width: MediaQuery.of(context).size.width*.45,
                      height: 200,
                       decoration: BoxDecoration(
                        border: Border.all()
                      ),
                      child: (service.pathImageCapture != "") ?Image.file(File(service.pathImageCapture)): Container(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text("Imagen Pick"),
                    Container(                     
                      width: MediaQuery.of(context).size.width*.45,
                      height: 200,
                       decoration: BoxDecoration(
                        border: Border.all()
                      ),
                      child: (service.pathImagePick != "") ?Image.file(File(service.pathImagePick)): Container(),
                    ),
                  ],
                ),
                                              
              ],
            ),  
            const SizedBox(
              height: 30,
            ),      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text("Video Capturada"),
                    Container(
                      width: MediaQuery.of(context).size.width*.45,
                      height: 200,
                       decoration: BoxDecoration(
                        border: Border.all()
                      ),
                      child: (service.pathVideoCapture != "") ?VideoPlayer(service.videoPlayerControllerCapture!): Container(),
                    ),
                    (service.pathVideoCapture != "")
                    ? Column(
                      children:[
                        IconButton(onPressed: ()async{
                          await service.videoPlayerControllerCapture!.play();              
                        }, icon: const Icon(Icons.play_arrow)),
                        IconButton(onPressed: ()async{
                          await service.videoPlayerControllerCapture!.pause();              
                        }, icon: const Icon(Icons.pause)),
                      ]
                    )
                    : Container()
                  ],
                ),
                Column(
                  children: [
                    const Text("Video Pick"),
                    Container(                     
                      width: MediaQuery.of(context).size.width*.45,
                      height: 200,
                       decoration: BoxDecoration(
                        border: Border.all()
                      ),
                      child: (service.pathVideoPick != "") ? VideoPlayer(service.videoPlayerControllerPick!): Container(),
                    ),
                    (service.pathVideoPick != "")
                    ? Column(
                      children:[
                        IconButton(onPressed: ()async{
                          await service.videoPlayerControllerPick!.play();              
                        }, icon: const Icon(Icons.play_arrow)),
                        IconButton(onPressed: ()async{
                          await service.videoPlayerControllerPick!.pause();              
                        }, icon: const Icon(Icons.pause)),
                      ]
                    )
                    : Container()
                  ],
                ),
                                              
              ],
            ),               
            
          ],
        ),
      ),
    );
  }
}