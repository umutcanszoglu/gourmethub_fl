import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gourmethub_fl/models/meals_model.dart';

class DotaService {
  static Dio getDio() {
    return Dio(BaseOptions(
        baseUrl: "https://www.themealdb.com/api/json/v1/1", responseType: ResponseType.json));
  }

  static Future<List<MealModel>?> getHeroes() async {
    try {
      final response = await getDio().get("/search.php", queryParameters: {"s": ""});
      if (response.statusCode == 200) {
        List<dynamic> items = response.data["meals"];
        return items.map((e) => MealModel.fromMap(e)).toList();
      }
    } on DioException catch (e) {
      debugPrint("Get Heroes  DioError: $e");
    } catch (e) {
      debugPrint("Get Heroes  Error: $e");
    }
    return null;
  }
}
