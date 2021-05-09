import 'package:flutter/material.dart';
import 'package:productivehub/models/book.dart';

class BookListItem extends StatelessWidget {
  final Book book;
  BookListItem(this.book);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              book.coverDir,
              width: 80,
            ),
            Column(
              children: [
                Text(book.name),
                Text("${book.currentPage} / ${book.totalPages}")
              ],
            )
          ],
        ),
      ),
    );
  }
}
