import 'package:flutter/material.dart';
import './widgets/categories_page.dart';
import './widgets/tabs.dart';
import './widgets/original.dart';
import './widgets/favorites.dart';
import './widgets/meal_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map filters = {
    'isGlutenFree': false,
    'isVegetarian': false,
    'isVegan': false,
    'isLactoseFree': false,
  };
  List filly = [];

  List _availableMeals = DUMMY_MEALS;

  List favorites = [];

  void setFilters(Map filterData, BuildContext ctx) {
    setState(() {
      filters = filterData;

      _availableMeals = DUMMY_MEALS.where((m) {
        return m.isGlutenFree == true && filters['isGlutenFree'] == true ||
            m.isVegetarian == true && filters['isVegetarian'] ||
            m.isVegan == true && filters['isVegan'] ||
            m.isLactoseFree == true && filters['isLactoseFree'];
      }).toList();
    });
  }

  void addFav(String id) {
    setState(() {
      final i = favorites.indexWhere((m) => m.id == id);
      if (i == -1) {
        final m = DUMMY_MEALS.firstWhere((m) => m.id == id);
        favorites.add(m);
      } else {
        final m = favorites.firstWhere((m) => m.id == id);
        favorites.remove(m);
      }
    });
  }

  isFav(String id) {
    final i = favorites.indexWhere((m) => m.id == id);
      if (i != -1) {
        return true;
      } else {
        return false;
      }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.purpleAccent,
          canvasColor: Colors.white,
          fontFamily: 'raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
                // body1: TextStyle(
                //   fontWeight: FontWeight.w900,
                //   fontSize: 20,
                //   color: Colors.deepPurple
                // ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'merienda',
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
          )),
      home: Tabs(favorites, setFilters, _availableMeals, filters),
      routes: {
        Favorites.routeName: (ctx) => Favorites(favorites),
        MealDetail.routeName: (ctx) => MealDetail(
              addFav: addFav,
              isFav: isFav,
            ),
      },
      // flutter's 404
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesListPage());
      },
    );
  }
}
