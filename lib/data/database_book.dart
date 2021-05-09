import 'package:sqflite/sqflite.dart';

class DatabaseBook {
  Future<void> createBookDatabase(Database database, int version) async {
    await database.execute("CREATE TABLE Book ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "total_pages INTEGER,"
        "current_page INTEGER,"
        "cover_dir TEXT"
        ")");
  }
}
