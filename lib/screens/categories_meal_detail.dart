import 'package:DeliMeals/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesMealDetail extends StatelessWidget {
  static const ROUTE_NAME = "/categories-meal-details";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String mealId = routeArgs["id"];
    final mealDetails = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetails.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                mealDetails.imageUrl,
                fit: BoxFit.cover,
              ),
              height: 300,
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(5),
              // alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                itemCount: mealDetails.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(5),
                    elevation: 5,
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        mealDetails.ingredients[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Steps",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(5),
              // alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                itemCount: mealDetails.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        // margin: EdgeInsets.all(5),
                        // elevation: 5,
                        // color: Theme.of(context).primaryColor,
                        // child: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text(
                        //     mealDetails.steps[index],
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        // ),
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(mealDetails.steps[index]),
                      ),
                      Divider()
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
