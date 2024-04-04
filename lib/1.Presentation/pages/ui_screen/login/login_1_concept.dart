import 'package:flutter/material.dart';

class Login1Page extends StatelessWidget {
  const Login1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final widthApp = MediaQuery.of(context).size.width*0.9;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            titulo(titulo: "Login 1"),
            textForm(context: context, texto: 'Correo', width: widthApp),
            textForm(context: context, texto: 'Contraseña', width: widthApp),
            boton(
              context: context, 
              nombreLogin: "Login", 
              color: Colors.green, width: widthApp),            
            saparador(
              texto: " or ", 
              width: widthApp),
            boton(
              context: context, 
              nombreLogin: "Login with Facebook", 
              color: Colors.blue,
              icon: Icons.facebook, 
              width: widthApp)
          ],
        ),
      ),
    );
  }
  
  Widget titulo({required String titulo}) {
    return Text(titulo);
  }
  
  Widget textForm({required BuildContext context,required double width, required String texto}) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: width,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: texto
          ),
        ),
      ),
    );
  }
  
  Widget boton({
    required BuildContext context, 
    IconData icon = Icons.add,
    required String nombreLogin,
    required Color color,
    required double width}) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      width: MediaQuery.of(context).size.width*0.9,
      height: 50,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (icon != Icons.add)
          ? Icon(icon)
          : Container(),
          SizedBox(width: 10,),
           Text(nombreLogin, style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
  
 Widget saparador({required String texto, required double width}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: 1,
        width: width - 20,
        color: Colors.black,),
        Text(texto, 
        style: const TextStyle(color: Colors.black, backgroundColor: Colors.white),
        )
    ],
  );
 }
}