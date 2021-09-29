import 'package:flutter/material.dart';
import '/dummy_data.dart';
import '/meal_category_screen/meal_item.dart';
import '/models/meal/meal.dart';

class MealCategoryScreen extends StatefulWidget {
  static const String routeNme = "/meal_category_screen";

  @override
  _MealCategoryScreenState createState() => _MealCategoryScreenState();
}

class _MealCategoryScreenState extends State<MealCategoryScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;
  var initStateData = false;

  @override
  void didChangeDependencies() {
    if (!initStateData) {
      final routesArges =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routesArges['id'];
      categoryTitle = routesArges['title'];

      displayedMeal = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      initStateData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMealId(String mealId) {
    setState(() {
      displayedMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            imageUrl: displayedMeal[index].imageUrl,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordability: displayedMeal[index].affordability,
            removeItem: _removeMealId,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
