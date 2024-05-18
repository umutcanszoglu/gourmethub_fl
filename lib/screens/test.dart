import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gourmethub_fl/controllers/meal_controller.dart';
import 'package:gourmethub_fl/screens/detail_page.dart';
import 'package:gourmethub_fl/utils/theme.dart';
import 'package:gourmethub_fl/widgets/area_chip.dart';
import 'package:gourmethub_fl/widgets/carousel_card.dart';
import 'package:gourmethub_fl/widgets/cat_chip.dart';
import 'package:gourmethub_fl/widgets/custom_divider.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MealController());
    return Scaffold(
      backgroundColor: CColors.black,
      appBar: AppBar(
        surfaceTintColor: CColors.black,
        backgroundColor: CColors.black,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_rounded,
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
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  //*** CATEGORIES ***
                  Text("Categories", style: FontStyles.myFont),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...controller.getCategories().map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.selectedCategory.value = e;
                                  },
                                  child: CatChip(
                                    color: controller.selectedCategory.value == e
                                        ? CColors.yellow
                                        : Colors.white.withOpacity(0.9),
                                    category: e,
                                    textColor: controller.selectedCategory.value == e
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  //***CAROUSEL SLIDER***
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 0.88,
                      enlargeFactor: 0.16,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 2,
                    ),
                    items: [
                      ...controller.meals
                          .where((e) => e.category == controller.selectedCategory.value)
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: CarouselCard(
                                heroTag: e.meal,
                                photo: e.mealThumb,
                                mealName: e.meal,
                                tags: controller.getTags(e),
                                onTap: () {
                                  Get.to(DetailPage(meal: e));
                                },
                              ),
                            ),
                          ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  //***FILTERED by AREA***
                  Text("Region", style: FontStyles.myFont),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 270,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...controller.getAreas().map(
                                    (e) => GestureDetector(
                                      onTap: () {
                                        controller.selectedArea.value = e;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 4.0),
                                        child: AreaChip(
                                          color: controller.selectedArea.value == e
                                              ? CColors.yellow
                                              : Colors.white.withOpacity(0.9),
                                          category: e,
                                          textColor: controller.selectedArea.value == e
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        const CustomVerticalDivider(
                          color: CColors.yellow,
                          indent: 8,
                          thickness: 1,
                          width: 1,
                          icon: Icons.fastfood_rounded,
                          iconColor: CColors.yellow,
                          iconSize: 15,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...controller.meals
                                    .where((e) => e.area == controller.selectedArea.value)
                                    .map(
                                      (e) => GestureDetector(
                                        onTap: () {
                                          Get.to(DetailPage(meal: e));
                                        },
                                        child: ListTile(
                                          dense: true,
                                          contentPadding: const EdgeInsets.all(4),
                                          leading: Hero(
                                            tag: e.meal,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(4),
                                              child: Image.network(e.mealThumb),
                                            ),
                                          ),
                                          title: Text(
                                            e.meal,
                                            style: FontStyles.myFont.copyWith(fontSize: 16),
                                          ),
                                          subtitle: Text(
                                            e.category,
                                            style: FontStyles.myFont
                                                .copyWith(fontSize: 12, color: CColors.yellow),
                                          ),
                                          trailing: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //*********** */
                ],
              ),
      ),
    );
  }
}
