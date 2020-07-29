import 'package:DeliMeals/dummy_data.dart';
import 'package:DeliMeals/models/meal.dart';
import 'package:DeliMeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const ROUTE_NAME = "/category-meal";

  // final String categoryTitle;
  // final String categoryId;

  // CategoriesMealScreen({this.categoryId , this.categoryTitle});

  final List<Meal> availableMeal;
  CategoriesMealScreen(this.availableMeal);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final categoryId = routeArgs["id"];
    final categoryTitle = routeArgs["title"];
    final List<Meal> categoryMEAL = availableMeal
        .where((element) => element.categories.contains(categoryId))
        .toList();

    // final data = DUMMY_MEALS.map((meals) => meals.categories.contains(categoryId));
    // print(data);

    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle"),
      ),
      body: ListView.builder(
        itemCount: categoryMEAL.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMEAL[index].id,
            title: categoryMEAL[index].title,
            imageUrl: categoryMEAL[index].imageUrl,
            duration: categoryMEAL[index].duration,
            complexity: categoryMEAL[index].complexity,
            affordability: categoryMEAL[index].affordability,
          );
        },
      ),
    );
  }
}
