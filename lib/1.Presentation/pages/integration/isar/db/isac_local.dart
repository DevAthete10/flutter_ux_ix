import 'dart:async';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/isar/models/nota.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

 class IsarLocal {
  static  Isar? _database;
  static final IsarLocal db = IsarLocal._();
  StreamController<List<NotaModel>> notasStream = StreamController<List<NotaModel>>.broadcast();
  IsarLocal._();

  Future<Isar> get database async {
    if (_database != null) return _database!;
    _database = await openDB();
    return _database!;
  }

  Future<Isar> openDB() async {
    if ( Isar.instanceNames.isEmpty ) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([ NotaModelSchema ], inspector: true,directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

 Future<List<NotaModel>> getAll()async{
  final db = await database;
  final resp = await db.notaModels.where().findAll();  
  notasStream.add(resp);
  return resp;
 }
 Future<bool> create(NotaModel nota)async{
  bool result = false;
  final db = await database;
  final notas = db.collection<NotaModel>();
  await db.writeTxn(() async {
    await notas.put(nota);
    result = true;
  });
  return result;
 }
 
 Future<bool> update(NotaModel notaActualizada)async{
  bool result = false;
  final db = await database;
  final notas = db.collection<NotaModel>();
  await db.writeTxn(() async {  
  final nota = await notas.get(notaActualizada.isarId!);
  print("Respuesta nota $nota");
  nota!.descripcion = notaActualizada.descripcion;
  nota.titulo = notaActualizada.titulo;
  await notas.put(nota);
});
  return result;
 }

  Future<bool> deleteNota( int id ) async {
  bool result = false;
  final db = await database;
  final notas = db.collection<NotaModel>();
  await db.writeTxn(() async {
    final resp = await notas.delete(id);
    result = resp;
    print('Recipe deleted: $result');
  });
    return result;
  }

   Future<Stream>  watchDB()async{
    final db = await database;  

    Stream userChanged = db.notaModels.watchLazy();      
    final List data = [];
    userChanged.listen((event) { 
      print("se actualizo la bd $event");
      data.add(event);
      getAll();
    });    
      return userChanged;
  }
}
