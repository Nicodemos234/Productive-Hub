import 'package:flutter/material.dart';
import 'package:productivehub/components/book_list_item.dart';
import 'package:productivehub/data/database_book.dart';
import 'package:productivehub/models/book.dart';
import 'package:productivehub/screens/add_books.dart';

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  bool isLoading = true;
  List<Book> books = [];
  @override
  void initState() {
    super.initState();
    DatabaseBook databaseBook = new DatabaseBook();
    databaseBook.getBooks().then((value) {
      setState(() {
        books = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[600],
        title: Text('Livros'),
        centerTitle: true,
      ),
      body: isLoading
          ? Text('Carregando')
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BookListItem(books[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange[600],
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddBooks(),
            ),
          );
        },
      ),
    );
  }
}
