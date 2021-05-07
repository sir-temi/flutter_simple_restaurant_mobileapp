import 'package:flutter/material.dart';
import 'package:meals_app/widgets/categories_page.dart';
import 'package:meals_app/widgets/favorites.dart';
import 'package:meals_app/widgets/drawer.dart';
import './settings.dart';
import './all_meals_list.dart';

class Tabs extends StatefulWidget {
  final List favorites;
  final Function setFilters;
  final List availableMeals;
  final filters;

  Tabs(this.favorites, this.setFilters, this.availableMeals, this.filters);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  

  int _selectedPage = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPage = index;
    });
  }

  get appbar{
    if (_selectedPage != 2 && _selectedPage != 3 && _selectedPage != 1) {
      return AppBar(
          title: Text(
            _selectedPage == 0
            ? "Tife's Cuisine"
            : _selectedPage == 1
              ? "My Favorites"
              : "Settings"
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar,
        drawer: MDrawer(widget.favorites, widget.setFilters, widget.availableMeals),
        body: _selectedPage == 0
        ?CategoriesListPage()
        :  _selectedPage == 1
          ? Favorites(widget.favorites)
          : _selectedPage == 2
            ? Settings(widget.setFilters, widget.filters)
            : AllMealsList(widget.availableMeals, widget.setFilters)
        ,
        bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColorDark,
          unselectedItemColor: Theme.of(context).accentColor,
          selectedItemColor: Colors.white,
          currentIndex: _selectedPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories')
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorites')
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings')
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              title: Text('Meals')
              )
            ]
          ),
    );

    // for top navbar
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Tife's Cuisine"),
    //       bottom: TabBar(tabs: <Widget>[
    //         Tab(icon: Icon(Icons.category), text: 'Categories',),
    //         Tab(icon: Icon(Icons.star), text: 'Favorites',)
    //       ]),
    //     ),
    //     body: TabBarView(children: [
    //       CategoriesListPage(),
    //       Favorites(),
    //     ]),
    //   ),
    // );
  }
}
