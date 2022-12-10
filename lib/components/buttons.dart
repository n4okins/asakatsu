import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final child;
  final onPressed;
  final color;
  final buttonheight;

  const MyButton({Key? key,
    required Widget this.child,
    required Function this.onPressed,
    Color this.color = const Color(0xff74e39a),
    double? this.buttonheight = 25,
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
          height: widget.buttonheight,
          width: 117,
          child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Colors.black),
                  ),
                  color: widget.color,
                  onPressed: widget.onPressed,
                  child: widget.child),
        ));
  }
}
