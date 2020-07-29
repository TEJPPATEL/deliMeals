import 'package:DeliMeals/screens/filter_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: InkWell(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Theme.of(context).primaryColor,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "MEALS APP",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed("/");
                    },
                    leading: Icon(Icons.restaurant),
                    title: Text("Meals"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, FiltersScreen.ROUTE_NAME);
                    },
                    leading: Icon(Icons.settings),
                    title: Text("Filter"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
