import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gourmethub_fl/utils/theme.dart';

class AreaChip extends StatelessWidget {
  const AreaChip({super.key, required this.color, required this.category, required this.textColor});
  final Color color;
  final String category;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: 70,
      height: 30,
      duration: 200.milliseconds,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        category,
        style: FontStyles.myFont.copyWith(fontSize: 14, color: textColor),
      ),
    );
  }
}
