import 'package:DeliMeals/screens/categories_screen.dart';
import 'package:DeliMeals/screens/favourite_screen.dart';
import 'package:DeliMeals/widgets/categories_item.dart';
import 'package:DeliMeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class BottomTabScreen extends StatefulWidget {
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  final List<Widget> _pagelist = [
    CategoriesScreen(),
    FavouriteScreen()
  ]; //wecan't update app title using this way use different way to return Map<String , dynamic >

  final List<Map<String, dynamic>> _pagelistWithTitle = [
    {'page': CategoriesScreen(), "title": "Categories"},
    {'page': FavouriteScreen(), "title": "Favourite"},
  ];

  int _selectedPageIndex = 0;
  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pagelistWithTitle[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pagelist[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,

        currentIndex:
            _selectedPageIndex, //very useful when change color of bottom navigation due to invisible inactive tab

        // type: BottomNavigationBarType.shifting, // use for ripple effect
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text("Categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Favourite")),
        ],
      ),
    );
  }
}
