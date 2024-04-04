import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/sqflite/models/nota_model.dart';

class DBSqlite {

  static  Database? _database;
  static final DBSqlite db = DBSqlite._();
  DBSqlite._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async{
    // Path de donde almacenaremos la base de datos
    final Directory documentsDirectory = await getTemporaryDirectory();

// final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

    // if(!kIsWeb) documentsDirectory = await getApplicationDocumentsDirectory();
    
    final path = join( documentsDirectory.path, 'NotassDB.db' );
    print(path);
    return await openDatabase(
      path,
      version: 2,
      onOpen: (db) { },
      onCreate: ( Database db, int version ) async {
        await db.execute('''
          CREATE TABLE Notas(
            id INTEGER PRIMARY KEY,
            titulo TEXT,
            descripcion TEXT
          )
        ''');
      }
    );
  }

  Future<int> nuevaNotaRaw( NotaModel nota ) async {    
    final db = await database;
    final res = await db.rawInsert('''
      INSERT INTO Notas( id, titulo, descripcion )
        VALUES( ${nota.id}, '${nota.titulo}', '${nota.descripcion}')
    ''');

    return res;
  }

  Future<int> nuevoNota( NotaModel nota ) async {
    final db = await database;
    final res = await db.insert('Notas', nota.toMap(),conflictAlgorithm: ConflictAlgorithm.replace );
    return res;
  }

  Future<List<NotaModel>> getNotas() async {
    final db  = await database;
    final res = await db.query('Notas');
    return res.isNotEmpty
          ? res.map( (s) => NotaModel.fromMap(s) ).toList()
          : [];
  }

  Future<List<NotaModel>> getNotaPorTitulo( String titulo ) async {
    final db  = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Notas WHERE titulo = '$titulo'    
    ''');
    return res.isNotEmpty
          ? res.map( (s) => NotaModel.fromMap(s) ).toList()
          : [];
  }


  Future<int> updateNota( NotaModel nota ) async {
    final db  = await database;
    final res = await db.update('Notas', nota.toMap(), where: 'id = ?', whereArgs: [ nota.id ] );
    return res;
  }

  Future<int> deleteNota( int id ) async {
    final db  = await database;
    final res = await db.delete( 'Notas', where: 'id = ?', whereArgs: [id] );
    return res;
  }

  Future<int> deleteNotas() async {
    final db  = await database;
    final res = await db.rawDelete('''
      DELETE FROM Scans    
    ''');
    return res;
  }


}

