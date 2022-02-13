import 'package:flutter/material.dart';

/// An icon button with a greyed icon at its background
class ElevatedIcon extends StatelessWidget {
  /// the icon to display
  final IconData icon;

  /// The icon color
  final Color iconColor;

  /// The icon size
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
