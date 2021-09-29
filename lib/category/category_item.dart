import 'package:flutter/material.dart';
import './../meal_category_screen/screens/meal_category_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({@required this.id, @required this.title, @required this.color});
  //const CategoryItem({Key key}) : super(key: key);

  /*
  void selectCategory(BuildContext ctx) {
    var categoryItem = {'id': id, 'title': title};
    Navigator.of(ctx)
        .pushNamed(MealCategoryScreen.routeNme, arguments: categoryItem);
  }
  */

  @override
  Widget build(BuildContext context) {
    var categoryItem = {'id': id, 'title': title};
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MealCategoryScreen.routeNme,
            arguments: categoryItem);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(25),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
