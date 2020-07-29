import 'package:DeliMeals/screens/categories_screen.dart';
import 'package:DeliMeals/screens/favourite_screen.dart';
import 'package:DeliMeals/widgets/categories_item.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Meals"),
            bottom: TabBar(
              
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.category),
                  child: Text("Categories"),
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  child: Text("Favourite"),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[CategoriesScreen(), FavouriteScreen()],
          ),
        ));
  }
}
