import 'package:flutter/material.dart';

class BookTextInput extends StatelessWidget {
  final Function validator;
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  BookTextInput(
      {this.validator,
      this.labelText,
      this.keyboardType,
      this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
