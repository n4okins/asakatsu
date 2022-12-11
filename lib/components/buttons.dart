import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final child;
  final onPressed;
  final color;
  final buttonHeight;
  final shape;

  const MyButton({Key? key,
    required Widget this.child,
    required Function this.onPressed,
    required RoundedRectangleBorder this.shape,
    Color this.color = const Color(0xff74e39a),
    double? this.buttonHeight = 25,
  })
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MyButtonState();
}

class MyButtonState extends State<MyButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
        child: SizedBox(
          height: widget.buttonHeight,
          width: 117,
          child: MaterialButton(
              shape: widget.shape,
              color: widget.color,
              onPressed: widget.onPressed,
              child: widget.child),
        ));
  }
}

Widget greenButton({required Widget child,
  required Function onPressed,
  RoundedRectangleBorder? shape,
  Color color = const Color(0xff74e39a),
  double? buttonHeight = 25}) {
  return MyButton(
      onPressed: onPressed,
      color: color, buttonHeight: buttonHeight,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: Colors.black),
    ),
      child: child
  );
}


Widget closeButton({required Widget child,
  required Function onPressed,
  RoundedRectangleBorder? shape,
  Color color = const Color(0xfff5f5f5),
  double? buttonHeight = 40}) {
  return MyButton(
      onPressed: onPressed,
      color: color, buttonHeight: buttonHeight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1),
        side: BorderSide(color: Colors.black),
      ),
      child: child
  );
}