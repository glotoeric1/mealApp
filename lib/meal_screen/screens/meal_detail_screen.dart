import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';
  //const MealDetailScreen({Key key}) : super(key: key);

  Widget sectionTitle({BuildContext context, titleText}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Text(
            titleText,
            style: Theme.of(context).textTheme.title,
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget buildContainer(child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 360,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealNewId = mealId['id'];
    final selectedMeals =
        DUMMY_MEALS.firstWhere((mealElect) => mealElect.id == mealNewId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeals.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //padding: EdgeInsets.only(left: 10, right: 10),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionTitle(context: context, titleText: "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeals.ingredients[index])),
                ),
                itemCount: selectedMeals.ingredients.length,
              ),
            ),
            sectionTitle(context: context, titleText: "Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeals.steps[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeals.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () {
          Navigator.of(context).pop(mealNewId);
        },
      ),
    );
  }
}
