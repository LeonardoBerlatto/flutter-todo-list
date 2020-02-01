import 'package:flutter/material.dart';
import 'package:todo_list/components/input/text-area.dart';
import 'package:todo_list/components/input/text-input.dart';

class AddToDoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      titlePadding: EdgeInsets.fromLTRB(30, 30, 30, 0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.library_books),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text('New ToDo'),
          )
        ],
      ),
      content: Form(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints.expand(height: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextInput('Title'),
                TextArea('Description')
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.blueAccent,
          child: Text('ADD'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
