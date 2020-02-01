import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const TextArea(this.labelText, {this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: null,
        style: TextStyle(fontSize: 18),
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          labelText: 'Description',
        ));
  }
}
