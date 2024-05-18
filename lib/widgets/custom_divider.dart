import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
    required this.color,
    required this.indent,
    required this.thickness,
    required this.width,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
  });
  final Color color;
  final double indent;
  final double thickness;
  final double width;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: VerticalDivider(
            color: color,
            endIndent: indent,
            thickness: thickness,
            width: width,
          ),
        ),
        Icon(icon, color: iconColor, size: iconSize),
        Expanded(
          child: VerticalDivider(
            color: color,
            indent: indent,
            thickness: thickness,
            width: width,
          ),
        ),
      ],
    );
  }
}
