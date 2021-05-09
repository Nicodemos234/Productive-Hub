import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:productivehub/data/database_book.dart';
import 'package:productivehub/models/book.dart';
import 'dart:io';

import 'package:productivehub/screens/books.dart';

class EditBook extends StatefulWidget {
  final Book book;
  EditBook(this.book);

  @override
  _EditBookState createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  final TextEditingController numberPagesAddController =
      new TextEditingController();

  @override
  void initState() {
    numberPagesAddController.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.name),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[600],
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.file(
              File(widget.book.coverDir),
            ),
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width,
            lineHeight: 14.0,
            percent: widget.book.currentPage / widget.book.totalPages,
            backgroundColor: Colors.grey,
            progressColor: Colors.deepOrange[600],
            center: Text(
              "${widget.book.currentPage} / ${widget.book.totalPages}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Páginas para adicionar',
              ),
              keyboardType: TextInputType.number,
              controller: numberPagesAddController,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                final Book newBook = new Book(
                  id: widget.book.id,
                  name: widget.book.name,
                  currentPage: widget.book.currentPage +
                      int.parse(numberPagesAddController.text),
                  totalPages: widget.book.totalPages,
                  coverDir: widget.book.coverDir,
                );
                DatabaseBook databaseBook = new DatabaseBook();
                databaseBook.updateBook(newBook).then((value) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Books(),
                    ),
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditBook(newBook),
                    ),
                  );
                });
              },
              child: Text('Adicionar')),
        ],
      ),
    );
  }
}
