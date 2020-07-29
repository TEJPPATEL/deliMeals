import 'package:DeliMeals/dummy_data.dart';
import 'package:DeliMeals/models/meal.dart';
import 'package:DeliMeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const ROUTE_NAME = "/filter-screen";

  final Function saveFilter;
  FiltersScreen({this.saveFilter});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _vegetrain = false;
  bool _vegan = false;
  bool _lactosfree = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filter"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // print(_glutenfree);
             final Map<String,bool> selectedFilters = {
                "gluten": _glutenfree,
                "lactose": _lactosfree,
                "vegetarain": _vegetrain,
                "vegan": _vegan
              };
              print(selectedFilters);
              widget.saveFilter(selectedFilters);
            }
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Adjust Your Meal Selection",
                  style: Theme.of(context).textTheme.title,
                )),
          ),
          Column(
            children: <Widget>[
              _switchListTileBuilder(
                  "Gluten Free", "Only Include Gluten Free Meals", _glutenfree,
                  (switchedtotrue) {
                setState(() { _glutenfree = switchedtotrue; });
              }),
              _switchListTileBuilder(
                  "Lactose Free",
                  "Only Include Lactose Free Meals",
                  _lactosfree, (switchedtotrue) {
                setState(() { _lactosfree = switchedtotrue;});
              }),
              _switchListTileBuilder(
                  "Vegetarain", "Only Include Vegetarain Meals", _vegetrain,
                  (switchedtotrue) {
                setState(() { _vegetrain = switchedtotrue;
                  print(_vegetrain);
                 });
              }),
              _switchListTileBuilder(
                  "Vegan", "Only Include Vegan Meals", _vegan,
                  (switchedtotrue) {
                setState(() { _vegan = switchedtotrue; });
              })
              // SwitchListTile(
              //   title: Text("Gluten Free"),
              //   subtitle: Text("Only Include Gulten Free meals"),
              //   value: _glutenfree,
              //   onChanged: (switchedtotrue) {
              //     setState(() {
              //       _glutenfree = switchedtotrue;
              //       print(_glutenfree);
              //     });
              //   },
              // )
            ],
          )
        ],
      ),
    );
  }

  _switchListTileBuilder(
      String title, String subtitle, value, Function updateFilter) {
    return Container(
      child: SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: updateFilter,
      ),
    );
  }
}
