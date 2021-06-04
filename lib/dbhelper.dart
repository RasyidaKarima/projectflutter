import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:project/models/item.dart';
import 'package:project/models/item1.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

Future<Database> initDb() async{

//untuk menentukan nama database dan lokasi yang  dibuat
Directory directory = await getApplicationDocumentsDirectory();
String path = directory.path +'item.db';

//create,read database 
var itemDatabase = openDatabase(path, version: 7, onCreate: _createDb);

//mengembalikan nilai object sebagai hasil dari fungsinya
return itemDatabase;
}
void _createDb(Database db, int version) async {
  await db.execute('''
    CREATE TABLE item (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      merk TEXT,
      name TEXT,
      price INTEGER,
      stok INTEGER,
      tanggalmasuk TEXT
      )
    ''');

      //buat tabel2 baru dengan nama keluar
     await db.execute('''
    CREATE TABLE item1 (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      merk TEXT,
      name TEXT,
      price INTEGER,
      reseller TEXT,
      tanggalkeluar TEXT,
      jumlah INTEGER
      )
    ''');
  }

  

  //select database
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'name');
    return mapList;
  }
  //select database1
  Future<List<Map<String, dynamic>>> select1() async {
    Database db = await this.initDb();
    var mapList = await db.query('item1', orderBy: 'name');
    return mapList;
  }

  //create databases
  Future<int> insert(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }
  //create databases1
  Future<int> insert1(Item1 object) async {
    Database db = await this.initDb();
    int count = await db.insert('item1', object.toMap());
    return count;
  }

  //update databases
  Future<int> update(Item object) async {
    Database db = await this.initDb();
    int count = await db.update('item', object.toMap(),
                                where: 'id=?',
                                whereArgs: [object.id]);
    return count;
  }
  //update databases1
  Future<int> update1(Item1 object) async {
    Database db = await this.initDb();
    int count = await db.update('item1', object.toMap(),
                                where: 'id=?',
                                whereArgs: [object.id]);  
    return count;
  }

  //delete databases
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item',
                                where: 'id=?',
                                whereArgs: [id]);
    return count;
}

  //delete databases1
  Future<int> delete1(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item1',
                                where: 'id=?',
                                whereArgs: [id]);
    return count;
}
  //menampilkan ketika save data pada tabel1
  Future<List<Item>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Item> itemList = List<Item>();
    for (int i=0; i<count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }   
    return itemList;
}
    //menampilkan ketika save data pada tabel2
    Future<List<Item1>> getItem1List() async {
    var item1MapList = await select1();
    int count = item1MapList.length;
    List<Item1> item1List = List<Item1>();
    for (int i=0; i<count; i++) {
      item1List.add(Item1.fromMap(item1MapList[i]));
    }   
    return item1List;
}

  factory DbHelper() {
    if (_dbHelper == null) {
    _dbHelper = DbHelper._createObject();
  }
  return _dbHelper;
  }
  Future<Database> get database async {
      if (_database == null) {
        _database = await initDb();
  }
  return _database;
    }
  }
