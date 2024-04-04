import 'package:flutter/material.dart';

class ModalOpcionesWidget extends StatelessWidget {
  final Color colorPrimary;
  final Color colorSecundary;
  const ModalOpcionesWidget({
    super.key, 
    required this.colorPrimary, 
    required this.colorSecundary});

  @override
  Widget build(BuildContext context) {
    final List<IconData> _icons = [Icons.access_alarm,Icons.miscellaneous_services_sharp];
    final List<String> _opciones = ["Recordatorio","Servicio"];
    return SizedBox(
                  height: 300,
                  width: 200,
                  child: Stack(                                
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(     
                          decoration: BoxDecoration(
                          color: colorSecundary,
                          borderRadius: BorderRadius.circular(20)
                          ),   
                          height: 200,
                          width: 200,
                          child: ListView.builder(
                            itemCount: _icons.length,
                            itemBuilder:(context, index) {
                            return ListTile(title: Text(_opciones[index]),leading: Icon(_icons[index], color: colorPrimary,),);
                          },),),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin:const EdgeInsets.only(bottom: 10),
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: const Icon(Icons.close, color: Colors.white,size: 30,),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
  }}