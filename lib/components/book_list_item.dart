import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:productivehub/models/book.dart';
import 'dart:io';

import 'package:productivehub/screens/edit_book.dart';

class BookListItem extends StatelessWidget {
  final Book book;
  BookListItem(this.book);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditBook(book),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.file(
                File(book.coverDir),
                width: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(book.name),
                    Container(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 120,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
