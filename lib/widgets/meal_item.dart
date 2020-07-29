import 'package:DeliMeals/models/meal.dart';
import 'package:DeliMeals/screens/categories_meal_detail.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {
      @required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration});

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;

      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  String get ComplexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;

      case Complexity.Simple:
        return "Simple";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.pushNamed((context),CategoriesMealDetail.ROUTE_NAME,arguments: { "id" :id });
  }

  @override
  Widget build(BuildContext context) {
  

    return InkWell(
      onTap:() => selectMeal(context) ,
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(imageUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    // width: 220,
                    // height: 50,
                    child: Text(
                      "$title",
                      // overflow: TextOverflow.fade,
                      // softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        // backgroundColor: Colors.red.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      Text(" $duration min")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      Text(" $ComplexityText")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(" $affordabilityText")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
