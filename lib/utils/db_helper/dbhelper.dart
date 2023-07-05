import 'dart:io';

import 'package:expences/expences/model/ex_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_Helper {
  Database? database;

  final String dbPath = "dbase.db";
  final String dbTname="datatable";

  Future<Database?> creatDB() async {
    if (database != null) {
      return database;
    }
    else {
      return await ininDB();
    }
  }

  Future<Database> ininDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbPath);
    String query='CREATE TABLE $dbTname (id INTEGER PRIMARY KEY AUTOINCREMENT,amount INTEGER ,date TEXT,time TEXT,category TEXT,status TEXT)';
    return await openDatabase(path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute(query);
      },
    );
  }


  Future<void> insertinDb(ExpenceModel expenceModel)
  async{
     database = await creatDB();
    //return await database!.insert('expencetable',{'note':notes,'amount':amount,'date':dates,'status':status,'time':time,'category':category});
    await database!.insert(dbTname, {
      'category':expenceModel.category,
      'amount':expenceModel.amount,
      'date':expenceModel.date,
      'status':expenceModel.status,
      'time':expenceModel.time,
    });
  }

  Future<List<Map>> read_Db()
  async {
    database= await creatDB();
    String query="SELECT * FORM $dbTname";
    List <Map> l1= await database!.rawQuery(query);
    return l1;

  }

}