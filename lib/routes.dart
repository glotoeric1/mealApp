import 'package:flutter/widgets.dart';
import 'package:mealapp/filters/screens/filters_screen.dart';
import 'package:mealapp/tabs/screens/tabs_screen.dart';
import 'package:mealapp/tabs_bottom/screens/tabs_bottom_screen.dart';
import './meal_screen/screens/meal_detail_screen.dart';
import './meal_category_screen/screens/meal_category_screen.dart';
import './category/screens/category_screen.dart';

final Map<String, WidgetBuilder> routes = {
  CategoriesScreen.routeName: (context) => CategoriesScreen(),
  MealCategoryScreen.routeNme: (context) => MealCategoryScreen(),
  MealDetailScreen.routeName: (context) => MealDetailScreen(),
  TabsScreen.routeName: (context) => TabsScreen(),
  TabsBottomScreen.routeName: (context) => TabsBottomScreen(),
  FilterScreen.routeName: (context) => FilterScreen(),
};
