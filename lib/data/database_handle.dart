import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandle {
  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'main.db');

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE Book ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "total_pages INTEGER,"
        "current_page INTEGER,"
        "cover_dir TEXT"
        ")");
  }
}
