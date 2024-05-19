import 'package:flutter/material.dart';
import 'package:gourmethub_fl/models/meals_model.dart';
import 'package:gourmethub_fl/utils/theme.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.meal, this.ontap});
  final MealModel meal;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: Hero(
                tag: meal.meal,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(meal.mealThumb),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(meal.meal, style: FontStyles.myFont),
                Text(meal.category,
                    style: FontStyles.myFont.copyWith(fontSize: 12, color: CColors.yellow)),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
