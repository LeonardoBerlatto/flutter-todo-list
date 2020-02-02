import 'package:flutter/material.dart';
import 'services/dialog-handler.dart';
import 'theme/style.dart';

import 'models/todo.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppHome(),
      title: 'My ToDo List',
      theme: appTheme(),
    );
  }
}

class AppHome extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<AppHome> {
  List<ToDo> _todoList = [];
  DialogHandler _dialogHandler;

  _HomeState() {
    this._dialogHandler = DialogHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dialogHandler.displayAddTodoDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
