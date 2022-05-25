import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;

  const AppIcon({
    Key? key,
    required this.icon,
    this.iconColor = const Color(0XFF756d54),
    this.backgroundColor = const Color(0XFFfcf4e4),
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(size / 2)),
      child: Icon(
        icon,
        size: 16,
        color: iconColor,
      ),
    );
  }
}
