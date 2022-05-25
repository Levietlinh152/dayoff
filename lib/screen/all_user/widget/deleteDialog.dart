import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDialog extends StatefulWidget {
  String title = "";
  String text = "";
  final Function onConfirmTap;
  final Function onCancelTap;

  CustomDialog(
      {Key? key,
      required this.title,
      required this.text,
      required this.onConfirmTap,
      required this.onCancelTap})
      : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('This is a demo alert dialog.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(child: Text('Confirm'), onPressed: () {}
            //   // print('Confirmed');
            //   // Navigator.of(context).pop();
            //
            ),
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
