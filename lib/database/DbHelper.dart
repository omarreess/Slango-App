import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DbHelper {

  static Database db ;
  static Future<void> databaseInit() async {
    final dbPath = await sql.getDatabasesPath();
      await sql.openDatabase(path.join(dbPath, 'slango.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_likes(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, uid TEXT, slang TEXT, def TEXT, ex TEXT)');
    }, version: 1).then((response) => db=response);
  }

  static Future<void> insert( Map<String, dynamic> data) async {
    // final db = await DbHelper.database();
    db.insert(
      'user_likes',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  static Future<List<Map<String, dynamic>>> getData(String uid) async {
    // final db = await DbHelper.database();
    return db.query('user_likes' ,orderBy: '"id" DESC',  where: '"uid" = ?', whereArgs: [uid]);
  }

}


//inset likes in Db
//DbHelper .insert({'slang':slang.slang , 'def':slang.def , 'ex':slang.ex});

//getting likes from db
//DbHelper .getData().then((value) => print('zeb ${value.last['slang']}'));
 /*
  //getting likes from db
    DbHelper .getData().then((list) =>list.
    forEach((item)
    {  slangsList.add(Slang(
        slang: item['slang'],
        ex: item['ex'],
        def: item['def']), 'uid':"1f"   );
    print('zek $item') ;})

         ) ;
  */
