import 'package:flutter/material.dart';

class ElevatedIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double? size;
  const ElevatedIcon({
    Key? key,
    required this.icon,
    required this.iconColor,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 1.0,
          top: 2.0,
          child: Icon(
            icon,
            color: Colors.black45,
            size: size,
          ),
        ),
        Icon(
          icon,
          color: iconColor,
          size: size,
        ),
      ],
    );
  }
}
