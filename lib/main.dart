import 'package:DeliMeals/screens/bottom_tabs_screen.dart';
import 'package:DeliMeals/screens/categories_meal_detail.dart';
import 'package:DeliMeals/screens/categories_meal_screen.dart';
import 'package:DeliMeals/screens/categories_screen.dart';
import 'package:DeliMeals/screens/filter_screen.dart';
import 'package:DeliMeals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegetarian": false,
    "vegan": false
  };

  List<Meal> availableMeal = DUMMY_MEALS;

   _setFilter(Map<String, bool> filterData) {
    setState(() {
      // print(DUMMY_MEALS);
      _filters = filterData;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters["gluten"]) {
          return false;
        }

        if (!meal.isLactoseFree && _filters["lactose"]) {
          return false;
        }

        if (!meal.isVegetarian && _filters["vegetarian"]) {
          return false;
        }

        if (!meal.isVegan && _filters["vegan"]) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    

    return MaterialApp(
      title: "Desi Meals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Robotcondensed',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            title: TextStyle(fontSize: 25, fontFamily: 'Robotocondensed')),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home:CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => BottomTabScreen(),
        CategoriesMealScreen.ROUTE_NAME: (context) =>
            CategoriesMealScreen(availableMeal),
        CategoriesMealDetail.ROUTE_NAME: (context) => CategoriesMealDetail(),
        FiltersScreen.ROUTE_NAME: (context) =>
            FiltersScreen(saveFilter: _setFilter)
      },
      onGenerateRoute: (settings) {
        //Useful when you unknown  route when you made appliation and get attribute of route
        if (settings.name == "/meal-details") {
          // return ;

          // return something related to getting this name meal-details like that handle all routes
        } else if (settings.name == "/something-else") {
          // return something related to getting this name something else route like that handle all remain routes
        }

        print(settings.arguments);
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },

      //unknownRoute is build when flutter fails to build screen with all other major and prevent crashing and show something
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return;
        });
      },
    );
  }
}
