import 'package:flutter/material.dart';

class NavIcon extends StatefulWidget {
  final IconData icon;
  final bool isActive;
  const NavIcon({Key? key, required this.icon, this.isActive = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => NavIconState();
}

class NavIconState extends State<NavIcon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        transform: Matrix4.translationValues(0, -8, 0.0),
        child: Text(
          String.fromCharCode(widget.icon.codePoint),
          style: TextStyle(
            color: widget.isActive ? Colors.black : Colors.grey,
            fontSize: 48,
            fontWeight: FontWeight.w100,
            fontFamily: Icons.search.fontFamily,
            package: Icons.search.fontPackage,
          ),
        )
    );
  }

}