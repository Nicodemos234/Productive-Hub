import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productivehub/components/grid_item.dart';
import 'package:productivehub/screens/books.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            GridItem(
              Icons.collections_bookmark,
              'Livros',
              Colors.deepOrange[600],
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Books(),
                  ),
                );
              },
            ),
            GridItem(
              Icons.person_pin,
              'Manias',
              Colors.lightBlue,
              onPressed: () {
                print("clique2");
              },
            ),
          ],
        ),
      ),
    );
  }
}
