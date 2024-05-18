import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gourmethub_fl/controllers/meal_controller.dart';
import 'package:gourmethub_fl/models/meals_model.dart';
import 'package:gourmethub_fl/utils/theme.dart';

class DetailPage extends GetView<MealController> {
  const DetailPage({super.key, required this.meal});
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: CColors.black,
        backgroundColor: CColors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: RichText(
          text: TextSpan(
            text: 'Gourmet',
            style: FontStyles.myFont,
            children: const <TextSpan>[
              TextSpan(
                text: 'Hub',
                style: TextStyle(color: CColors.yellow, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: CColors.black,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Hero(
            tag: meal.meal,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(meal.mealThumb),
            ),
          ),
          const SizedBox(height: 8),
          Text(meal.meal, style: FontStyles.myFont),
          const SizedBox(height: 8),
          Row(
            children: [
              ...controller.getTags(meal).map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: CColors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          e,
                          style: FontStyles.myFont.copyWith(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            meal.instructions,
            style: FontStyles.myFont.copyWith(fontSize: 12, color: CColors.cream),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(CColors.yellow),
            ),
            onPressed: () {},
            child: Text(
              "Add to Favorite",
              style: FontStyles.myFont.copyWith(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
