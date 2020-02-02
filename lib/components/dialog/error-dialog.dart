import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String _text;

  const ErrorDialog(this._text);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: <Widget>[
          Icon(Icons.error, color: Colors.red),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text('Error', style: TextStyle(color: Colors.red)),
          )
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(_text),
          ],
        ),
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey[800],
          child: Text('ok'.toUpperCase()),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
