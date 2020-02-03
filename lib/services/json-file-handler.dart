import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/services/dialog-handler.dart';

class JsonFileHandler {
  DialogHandler _dialogHandler;

  JsonFileHandler() {
    this._dialogHandler = DialogHandler();
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/tasks-data.json');
  }

  Future<File> saveFile(List<ToDo> todoList) async {
    String encodedJsonList = json.encode(todoList);
    final File file = await _getFile();
    return file.writeAsString(encodedJsonList);
  }

  Future<String> readEncodedToDoList(BuildContext context) async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (error) {
      _dialogHandler.displayErrrorDialog(context, 'Error while reading data');
    }
    return null;
  }
}
