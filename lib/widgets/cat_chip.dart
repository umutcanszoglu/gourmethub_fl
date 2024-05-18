import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gourmethub_fl/utils/theme.dart';

class CatChip extends StatelessWidget {
  const CatChip({super.key, required this.color, required this.category, required this.textColor});
  final Color color;
  final String category;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 200.milliseconds,
      padding: const EdgeInsets.all(8),
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
