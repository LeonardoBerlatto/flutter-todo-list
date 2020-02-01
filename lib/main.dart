import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list/theme/style.dart';

import 'components/dialog/add-todo-dialog.dart';
import 'models/todo.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppHome(),
      title: 'My ToDo List',
      theme: appTheme()
    );
  }
}

class AppHome extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<AppHome> {
  List<ToDo> _todoList = [];

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/tasks-data.json');
  }

  Future<File> _saveFile() async {
    String encodedJsonList = json.encode(_todoList);
    final File file = await _getFile();
    return file.writeAsString(encodedJsonList);
  }

  Future<void> _displayDialog() async {
    return showGeneralDialog<void>(
        context: context,
        transitionBuilder: (context, firstAnimation, secondAnimation, widget) {
          return Transform.scale(
            scale: firstAnimation.value,
            child: AddToDoDialog(),
          );
        },
        transitionDuration: Duration(milliseconds: 250),
        barrierDismissible: false,
        barrierLabel: '',
        pageBuilder: (context, animation1, animation2) {
          return null;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await _displayDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
