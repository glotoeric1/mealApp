import 'package:flutter/material.dart';
import '/favorites/screens/favourite_screen.dart';
import '/category/screens/category_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = "/tabs_screen";
  const TabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meal'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Categories'),
              Tab(icon: Icon(Icons.star), text: 'Favorites'),
            ],
          ),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavouritesScreen(),
        ]),
      ),
    );
  }
}
