import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final String title;
  final String body;

  const ResultDialog({Key key, this.title, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(body, textAlign: TextAlign.center),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
}
