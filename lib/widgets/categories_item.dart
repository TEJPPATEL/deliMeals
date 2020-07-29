import 'package:DeliMeals/screens/categories_meal_screen.dart';
import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoriesItem({this.title, this.color,this.id});

  void selectCategory(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //   return CategoriesMealScreen(categoryId: id,categoryTitle: title);
    // }));

    Navigator.of(context).pushNamed(CategoriesMealScreen.ROUTE_NAME , arguments: { 'id':id, 'title' : title });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        // color: Colors.red,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.8), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 5, color: color),
            color: Colors.green),
        padding: EdgeInsets.all(5),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
