import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/firebase/firestore/nota_model.dart';

class ServiceFirestore {
  
  FirebaseFirestore db = FirebaseFirestore.instance;
  static final ServiceFirestore _singleton =  ServiceFirestore._internal();
  NotaModel? notaSeleccionada;

    factory ServiceFirestore() {
    return _singleton;
  }

  List<NotaModel> getNotas(List<QueryDocumentSnapshot<Object?>> data){
    final List<NotaModel> notas = [];
    for (var nota in data) {
          final NotaModel temp =NotaModel(
            titulo: nota.get("titulo"), 
            descripcion: nota.get("descripcion"));
          temp.id = nota.id;
          notas.add(temp);
    }     
    return notas;
  }

  Future<bool> putNota()async{
    bool result = false; 
    db.collection("notas").doc(notaSeleccionada!.id).update(notaSeleccionada!.toMap())
              .then((value){
                  result = true;
              });        
     return result;
  }

  Future<NotaModel> postNota()async{
     late NotaModel result;         
     await db.collection("notas").add(notaSeleccionada!.toMap())
             .then((DocumentReference doc){                
                result = notaSeleccionada!;
             });
     return result;
  }

  Future<bool> deleteNotaInIosOrAndroid()async{
    bool result = false;    
    db.collection("notas").doc(notaSeleccionada!.id).delete()
          .then((value){
              result = true;              
          });      
     return result;
  }

  Stream<QuerySnapshot> getData() => db.collection("notas").snapshots();

  ServiceFirestore._internal();
}