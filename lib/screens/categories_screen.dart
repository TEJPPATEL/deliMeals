import 'package:DeliMeals/widgets/categories_item.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';
// import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Desi Meals"),
      // ),
      body: Container(
        padding: EdgeInsets.all(5),
              child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: 
            DUMMY_CATEGORIES.map((data) {
              return CategoriesItem(color: data.color,title: data.title,id:data.id);
            }).toList()
        
        ),
      ),
    );
  }
}
