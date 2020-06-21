import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  static Future<Database>database()async{
    final dbPath = await getDatabasesPath();
    return  openDatabase(
      join(dbPath,'favorites.db'),
      version: 1, 
      onCreate: (db, version){
        return db.execute('CREATE TABLE fav_quotes(id TEXT PRIMARY KEY)');
      }
    
    );
  }

  static Future<void> insert(String table, Map<String, dynamic> data)async{
    final sqlDb = await DbHelper.database();
    sqlDb.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
    
  }

  static Future<List<Map<String,dynamic>>>getData(String table)async{
    final sqlDb = await DbHelper.database();
    return sqlDb.query(table);
  }

  static Future<int>delete(String table, String id)async{
    final sqlDb = await DbHelper.database();
    return sqlDb.delete(table, where: "id=?", whereArgs: [id]);
  }


}