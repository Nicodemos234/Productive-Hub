import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database_book.dart';

class DatabaseHandle {
  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'main.db');

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    DatabaseBook bookData = new DatabaseBook();
    await bookData.createBookDatabase(database, version);
  }
}
