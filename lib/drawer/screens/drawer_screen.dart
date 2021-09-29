import 'package:flutter/material.dart';
import '/tabs_bottom/screens/tabs_bottom_screen.dart';
import '/filters/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget listTileBuilder(
      String listTitle, IconData listIcon, Function onPressHandler) {
    return ListTile(
      leading: Icon(
        listIcon,
        size: 26,
      ),
      title: Text(
        listTitle,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onPressHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking up",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listTileBuilder(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(TabsBottomScreen.routeName);
              //Navigator.pushNamed(context, TabsBottomScreen.routeName);
            },
          ),
          listTileBuilder(
            "Filter",
            Icons.settings,
            () {
              //Navigator.of(context).pushNamed(FilterScreen.routeName);
              Navigator.pushReplacementNamed(context, FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
