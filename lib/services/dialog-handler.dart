import 'package:flutter/material.dart';
import 'package:todo_list/components/dialog/add-todo-dialog.dart';
import 'package:todo_list/components/dialog/error-dialog.dart';
import 'package:todo_list/models/todo.dart';

class DialogHandler {
  Future<void> _displayDialog(BuildContext context, Widget dialog) {
    return showGeneralDialog<void>(
        context: context,
        transitionBuilder: (context, firstAnimation, secondAnimation, widget) {
          return Transform.scale(
            scale: firstAnimation.value,
            child: dialog,
          );
        },
        transitionDuration: Duration(milliseconds: 250),
        barrierDismissible: false,
        barrierLabel: '',
        pageBuilder: (context, animation1, animation2) {
          return null;
        });
  }

  void displayAddTodoDialog(BuildContext context, Function(ToDo) function) async {
    await _displayDialog(context, AddToDoDialog(callback: function));
  }

  void displayErrrorDialog(BuildContext context, String text) async {
    await _displayDialog(context, ErrorDialog(text));
  }

}
