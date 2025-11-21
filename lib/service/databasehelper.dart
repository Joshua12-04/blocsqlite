import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi/windows/sqflite_ffi_setup.dart';

import '../model/studentmodel.dart';

class DatabaseHelper {
  // singleton
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> getDataBase() async {
    if (_database != null) {
      return _database!;
    } else {
      // La base de datos no esta inicializada
      _database = await initDB("js.db");
      return _database!;
    }
  }

  Future<Database?> initDB(String filePath) async {
    String dbPath, path;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      dbPath = await databaseFactoryFfi.getDatabasesPath();
      path = join(dbPath, filePath);
      return await databaseFactoryFfi.openDatabase(
        path,
        options: OpenDatabaseOptions(version: 1, onCreate: onCreate),
      );
    }
    if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia) {
      dbPath = await getDatabasesPath();
      path = join(dbPath, filePath);
      return await openDatabase(path, version: 1, onCreate: onCreate);
    }
  }

  FutureOr<void> onCreate(Database db, int version) async {
    return await db.execute("""
    create table student (
    id integer primary key not null unique,
    age integer not null,
    name varchar(50) not null
    );     
    """);
  }

  // Crud
  Future<Student> Create(Student student) async {
    final db = await instance.getDataBase();
    int newId = await db.insert('student', student.toMap());
    return Student(id: newId, age: student.age, name: student.name);
  }

  Future<List<Student>> ReadAll() async {
    final db = await instance.getDataBase();
    final data = await db.query("student");
    return data.map((map) => Student.fromMap(map)).toList();
  }

  Future<int> Update(Student student) async {
    final db = await instance.getDataBase();
    return await db.update(
      "student",
      student.toMap(),
      where: 'id=?',
      whereArgs: [student.id],
    );
  }

  Future<int> Delete(Student student) async {
    final db = await instance.getDataBase();
    return await db.delete("student", where: 'id=?', whereArgs: [student.id]);
  }

  void Close() async{
    final db = await instance.getDataBase();
    db.close();
  }
} // end class
