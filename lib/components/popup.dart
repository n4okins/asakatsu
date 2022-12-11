import 'package:flutter/material.dart';

class Dialogs extends StatefulWidget {
  final Widget child;
  final double heightFactor;
  final double widthFactor;

  const Dialogs({
    Key? key,
    required this.child,
    this.heightFactor = 0.8,
    this.widthFactor = 1.0,
  }) : super(key: key);

  @override
  DialogsState createState() => DialogsState();
}

class DialogsState extends State<Dialogs> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: FractionallySizedBox(
          heightFactor: widget.heightFactor,
          widthFactor: widget.widthFactor,
          child: widget.child,
        ));
  }
}


