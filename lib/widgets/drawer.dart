import 'package:flutter/material.dart';
import 'package:meals_app/widgets/favorites.dart';
import './all_meals_list.dart';
import './settings.dart';
import './tabs.dart';
import './original.dart';

class MDrawer extends StatefulWidget {
  final favorties;
  final setFilters;
  final availableMeals;
  MDrawer(this.favorties, this.setFilters, this.availableMeals);

  @override
  _MDrawerState createState() => _MDrawerState();
}

class _MDrawerState extends State<MDrawer> {
  Map filters = {
    'isGlutenFree': false,
    'isVegetarian': false,
    'isVegan': false,
    'isLactoseFree': false,
  };
  List filly = [];

  List availableMeals = DUMMY_MEALS;

  List favorites = [];

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, Widget tapPer) {
      void showPage(BuildContext ctx) {
        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
          return tapPer;
        }));
      }

      return ListTile(
        onTap: () => showPage(context),
        leading: Icon(
          icon,
          size: 32,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight),
            ),
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          buildListTile('Home', Icons.home, Tabs(widget.favorties,widget.setFilters,widget.availableMeals, null)),
          ],
      ),
    );
  }
}
