import 'package:productivehub/data/database_handle.dart';
import 'package:productivehub/models/book.dart';
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

  Future<int> createBook(Book book) async {
    final database = await getDatabaseHandle();
    int result = await database.insert("Book", book.toJson());
    return result;
  }

  Future<int> updateBook(Book book) async {
    final database = await getDatabaseHandle();
    return await database
        .update("Book", book.toJson(), where: "id = ?", whereArgs: [book.id]);
  }

  Future<List<Book>> getBooks() async {
    final database = await getDatabaseHandle();
    List<Map<String, Object>> result = await database.query("Book",
        columns: ["id", "name", "total_pages", "current_page", "cover_dir"]);
    List<Book> books = [];
    for (Map<String, dynamic> element in result) {
      books.add(Book.fromJson(element));
    }
    return books;
  }

  Future<Database> getDatabaseHandle() async {
    final DatabaseHandle databaseHandle = DatabaseHandle();
    final Database database = await databaseHandle.createDatabase();
    return database;
  }
}
