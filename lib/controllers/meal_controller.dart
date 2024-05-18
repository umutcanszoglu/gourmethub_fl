import 'package:get/get.dart';
import 'package:gourmethub_fl/models/meals_model.dart';
import 'package:gourmethub_fl/services/meals_api.dart';

class MealController extends GetxController {
  final meals = <MealModel>[].obs;
  final isLoading = true.obs;
  final selectedCategory = "Seafood".obs;
  final selectedArea = "Egyptian".obs;

  @override
  void onInit() async {
    final values = await DotaService.getHeroes();
    meals.addAll(values ?? []);
    isLoading.value = false;
    super.onInit();
  }

  List<String> getCategories() {
    var categories = <String>[];
    for (var meal in meals) {
      if (!(categories.contains(meal.category))) {
        categories.add(meal.category);
      }
    }

    return categories;
  }

  List<String> getTags(MealModel meal) {
    var tags = meal.tags?.split(",") ?? ["Meal", "Flavor", "Delicious", "Food", "Recipe"];
    return tags;
  }

  List<String> getAreas() {
    var areas = <String>[];
    for (var meal in meals) {
      if (!(areas.contains(meal.area))) {
        areas.add(meal.area);
      }
    }
    return areas;
  }
}
