import 'package:flutter/material.dart';
import 'package:gourmethub_fl/utils/theme.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard(
      {super.key,
      required this.photo,
      required this.mealName,
      required this.tags,
      this.onTap,
      required this.heroTag});
  final String photo;
  final String mealName;
  final List<String> tags;
  final Function()? onTap;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(photo),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealName,
                    style: FontStyles.myFont
                        .copyWith(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Wrap(
                      spacing: 3,
                      runSpacing: 3,
                      children: [
                        ...tags.map(
                          (e) => Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: CColors.orange,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              e,
                              style: FontStyles.myFont.copyWith(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
