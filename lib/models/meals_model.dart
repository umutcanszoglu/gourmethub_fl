import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MealModel {
  final String id;
  final String meal;
  final String category;
  final String area;
  final String instructions;
  final String mealThumb;
  final String? tags;
  final String youtube;
  MealModel({
    required this.id,
    required this.meal,
    required this.category,
    required this.area,
    required this.instructions,
    required this.mealThumb,
    this.tags,
    required this.youtube,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'meal': meal,
      'category': category,
      'area': area,
      'instructions': instructions,
      'mealThumb': mealThumb,
      'tags': tags,
      'youtube': youtube,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      id: map['idMeal'] as String,
      meal: map['strMeal'] as String,
      category: map['strCategory'] as String,
      area: map['strArea'] as String,
      instructions: map['strInstructions'] as String,
      mealThumb: map['strMealThumb'] as String,
      tags: map['strTags'] == null ? null : map['strTags'] as String,
      youtube: map['strYoutube'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) =>
      MealModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
