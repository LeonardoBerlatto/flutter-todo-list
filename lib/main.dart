import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/services/json-file-handler.dart';
import 'services/dialog-handler.dart';
import 'theme/style.dart';

import 'models/todo.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  JsonFileHandler _jsonFileHandler;

  ToDo _lastRemoved;
  int _lastRemovedIndex;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _HomeState() {
    this._dialogHandler = DialogHandler();
    this._jsonFileHandler = JsonFileHandler();
  }

  @override
  void initState() {
    super.initState();
    _jsonFileHandler.readEncodedToDoList(context).then((encodedList) {
      this.setState(() => this._todoList = jsonDecode(encodedList)
          .map((toDo) => ToDo.fromJson(toDo))
          .cast<ToDo>()
          .toList());
    });
  }

  IconData _renderIconByTodoStatus(bool isDone) {
    return isDone ? Icons.check : Icons.clear;
  }

  void _addTodo(ToDo todo) {
    setState(() {
      _todoList.add(todo);
    });
    _jsonFileHandler.saveFile(_todoList);
  }

  Widget buildToDo(BuildContext context, int index) {
    return Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        background: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment(-1, 0.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        direction: DismissDirection.startToEnd,
        child: CheckboxListTile(
          title: Text(_todoList[index].title, style: TextStyle(fontSize: 22)),
          subtitle: Text(_todoList[index].description,
              style: TextStyle(fontSize: 16)),
          value: _todoList[index].isDone,
          secondary: CircleAvatar(
              child: Icon(_renderIconByTodoStatus(_todoList[index].isDone))),
          onChanged: (isDone) {
            setState(() {
              _todoList[index].isDone = isDone;
            });
            _jsonFileHandler.saveFile(_todoList);
          },
        ),
        onDismissed: (direction) => this._removeToDo(index));
  }

  _removeToDo(int index) {
    this.setState(() {
      this._lastRemovedIndex = index;
      this._lastRemoved = _todoList[index];
      _todoList.removeAt(index);
    });
    _jsonFileHandler.saveFile(_todoList);

    final SnackBar snackBar = SnackBar(
      content: Text('ToDo ${_lastRemoved.title} has been removed!' ?? ''),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            this.setState(() {
              _todoList.insert(_lastRemovedIndex, _lastRemoved);
            });
            _jsonFileHandler.saveFile(_todoList);
          }),
    );

    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Future<void> _refreseToDoList() async {
    await Future.delayed(Duration(seconds: 1));
    this.setState(() {
      _sortToDoList();
      _jsonFileHandler.saveFile(_todoList);
    });
  }

  void _sortToDoList() {
    this._todoList.sort((a, b) {
      if (a.isDone && !b.isDone) {
        return 1;
      }

      if (!a.isDone && b.isDone) {
        return -1;
      }

      return 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('ToDo List'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreseToDoList,
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: buildToDo,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            _dialogHandler.displayAddTodoDialog(context, this._addTodo),
        child: Icon(Icons.add),
      ),
    );
  }
}
