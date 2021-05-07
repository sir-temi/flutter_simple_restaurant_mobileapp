import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
// import './all_meals_list.dart';

class Settings extends StatefulWidget {
  final Function setFilter;
  final filters;
  Settings(this.setFilter, this.filters);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitch(
    String title,
    String subTitle,
    value,
    Function updateValue,
  ) {
    return Platform.isAndroid
        ? SwitchListTile(
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // color: Theme.of(context).primaryColorDark,
                fontSize: 21,
                fontFamily: 'raleway',
              ),
            ),
            value: value,
            subtitle: Text(
              subTitle,
            ),
            onChanged: updateValue)
        : MergeSemantics(
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: Theme.of(context).primaryColorDark,
                  fontSize: 21,
                  fontFamily: 'raleway',
                ),
              ),
              subtitle: Text(
                subTitle,
              ),
              trailing: CupertinoSwitch(
                activeColor: Theme.of(context).accentColor,
                value: value,
                onChanged: updateValue,
              ),
            ),
          );
  }

  @override
  void initState() {
    _glutenFree = widget.filters['isGlutenFree'];
    _vegetarian = widget.filters['isVegetarian'];
    _vegan = widget.filters['isVegan'];
    _lactoseFree = widget.filters['isLactoseFree'];
    super.initState();
  }

  snaky() {
    final snackBar = SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Theme.of(context).accentColor,
        content: Row(
          children: <Widget>[
            Icon(Icons.thumb_up),
            SizedBox(
              width: 20,
            ),
            Text(
              'Filters saved',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  filty() => widget.setFilter({
        'isGlutenFree': _glutenFree,
        'isVegetarian': _vegetarian,
        'isVegan': _vegan,
        'isLactoseFree': _lactoseFree,
      }, context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      // drawer: MDrawer(widget.setFilter),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Ajust your meal selection',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark,
                fontSize: 23,
                fontFamily: 'raleway',
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitch(
                  'Gluten Free', 'Include gluten free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitch(
                  'Lactose Free', 'Include lactose free meals', _lactoseFree,
                  (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitch(
                  'Vegeterian', 'Include vegeterian meals', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitch('Vegan', 'Include Vegan meals', _vegan, (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ],
          ))
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          onTap: () {},
          child: FloatingActionButton(
            splashColor: Theme.of(context).primaryColor,
            onPressed: () {
              snaky();
              filty();
            },
            child: Icon(
              Icons.save,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }
}
