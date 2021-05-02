import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productivehub/models/gridItem.dart';

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
              Colors.deepPurple,
              onPressed: () {
                print("clique1");
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
