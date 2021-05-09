import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:productivehub/models/book.dart';
import 'dart:io';

class EditBook extends StatelessWidget {
  Book book;
  EditBook(this.book);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[600],
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.file(
              File(book.coverDir),
            ),
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width,
            lineHeight: 14.0,
            percent: book.currentPage / book.totalPages,
            backgroundColor: Colors.grey,
            progressColor: Colors.deepOrange[600],
            center: Text(
              "${book.currentPage} / ${book.totalPages}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
