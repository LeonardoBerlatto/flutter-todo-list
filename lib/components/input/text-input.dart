import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Function validator;

  const TextInput(this.labelText, {this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
          ),
          controller: controller,
        ));
  }
}
