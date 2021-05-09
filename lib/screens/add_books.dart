import 'dart:io';
import 'package:flutter/material.dart';
import 'package:productivehub/components/book_text_input.dart';
import 'package:productivehub/data/database_book.dart';
import 'package:productivehub/models/book.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productivehub/screens/books.dart';

class AddBooks extends StatefulWidget {
  @override
  _AddBooksState createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameEditingController =
      new TextEditingController();
  final TextEditingController pageTotEditingController =
      new TextEditingController();

  File _image;
  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionando Livro'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[700],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BookTextInput(
                textEditingController: nameEditingController,
                labelText: 'Nome do livro',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insira o nome do livro";
                  }
                  return null;
                },
              ),
              BookTextInput(
                textEditingController: pageTotEditingController,
                keyboardType: TextInputType.number,
                labelText: 'Total de páginas',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insira o total de páginas do livro";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _selectCoverOptions,
                child: Text('Selecionar capa'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Book book = new Book(
                        name: nameEditingController.text,
                        totalPages: int.parse(pageTotEditingController.text),
                        coverDir: _image.path,
                        currentPage: 0);
                    DatabaseBook databaseBook = new DatabaseBook();
                    databaseBook.createBook(book).then((value) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Books(),
                        ),
                      );
                    });
                  }
                },
                child: Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectCoverOptions() async {
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: Text('Utilizar:'),
        children: [
          SimpleDialogOption(
            child: Text('Camera'),
            onPressed: () {
              getImage(ImageSource.camera);
              Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: Text('Galeria'),
            onPressed: () {
              getImage(ImageSource.gallery);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
