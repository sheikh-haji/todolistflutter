import 'package:flutter/foundation.dart';
import 'package:todolist/models/items.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper extends ChangeNotifier {
  DatabaseHelper._PrivateConstructor();
  DatabaseHelper();
  static final DatabaseHelperinstance = DatabaseHelper._PrivateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'items.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE items(id INTEGER PRIMARY KEY,name TEXT,isDone INTEGER)');
  }
  //  CREATE
  Future<int> add(Item grocery) async
  {
    print("success");
    Database db=await DatabaseHelperinstance.database;
    return await db.insert('items',grocery.toMap());

  }
  //READ
  Future<List<Item>> getGroceries() async {
    Database db = await DatabaseHelperinstance.database;
    var groceries = await db.query('items');
    List<Item> ItemList = groceries.isNotEmpty
        ? groceries.map((c) => Item.fromMap(c)).toList()
        : [];
    return ItemList;
  }
  //DELETE
  Future<int> remove(int? id)async{
    Database db=await DatabaseHelperinstance.database;
    return await db.delete('items',where:'id= ?',whereArgs: [id]);

  }
  //UPDATE
  Future<int> update(Item grocery)async{
    Database db=await DatabaseHelperinstance.database;
    return await db.update('items',grocery.toMap(),where:'id= ?',whereArgs: [grocery.id]);
  }
  Future<int> modifytask(Item grocery,String name)async{
    Database db=await DatabaseHelperinstance.database;
    grocery.name=name;
    print(name);
    print('sohjhjhfhjfjhgj');
    return await db.update('items',grocery.toMap(),where:'id= ?',whereArgs: [grocery.id]);
  }
  Future toggle(Item grocery)async{
    Database db=await DatabaseHelperinstance.database;
    int temp0=0;
    int temp1=1;
    var id=grocery.id;
    if(grocery.isDone==1){
      print('update1');
      query();
      grocery.isDone=0;
      return await db.update('items',grocery.toMap(),where:'id= ?',whereArgs: [id]);
      // return await db.execute('UPDATE items SET isDone=0 WHERE name=$temp');
    }
    else{
      print('update 2');
      query();
      grocery.isDone=1;
      // return await db.execute('UPDATE items SET isDone=1 WHERE name=$temp');
      return await db.update('items',grocery.toMap(),where:'id= ?',whereArgs: [id]);}
    }
  void query() async {

    // get a reference to the database
    Database db = await DatabaseHelperinstance.database;

    // get all rows
    List<Map> result = await db.query('items');

    // print the results
    result.forEach((row) => print(row));
    // {_id: 1, name: Bob, age: 23}
    // {_id: 2, name: Mary, age: 32}
    // {_id: 3, name: Susan, age: 12}
  }
  Future<int> length() async{
    Database db=await DatabaseHelperinstance.database;
    int? count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM items'));
    int c=(count==null)?0:count;
    return c;
  }
  // Future<int> () async{
  //   Database db=await DatabaseHelperinstance.database;
  //   int? count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM items where id=$temp'));
  //   int c=(count==null)?0:count;
  //   return c;
  // }
}
