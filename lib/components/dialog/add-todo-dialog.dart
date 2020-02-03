import 'package:flutter/material.dart';
import 'package:todo_list/components/input/text-area.dart';
import 'package:todo_list/components/input/text-input.dart';
import 'package:todo_list/models/todo.dart';

class AddToDoDialog extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final Function(ToDo) callback;

  AddToDoDialog({this.callback});

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
        child: Container(
          constraints: BoxConstraints.expand(height: 200),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextInput('Title', controller: _titleController),
                TextArea('Description', controller: _descriptionController),
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
            callback(ToDo(
                _titleController.text, _descriptionController.text, false));
            _titleController.clear();
            _descriptionController.clear();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
