import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer.dart';
import './meal_item.dart';

class AllMealsList extends StatefulWidget {
  final filtered;
  final setFilters;
  AllMealsList(this.filtered, this.setFilters);

  @override
  _AllMealsListState createState() => _AllMealsListState();
}

class _AllMealsListState extends State<AllMealsList> {

  // List get filtered{
  //   if (widget.favorites.length == 0) {
  //     return DUMMY_MEALS;
  //   } else {
  //     final dummy = DUMMY_MEALS.where((m){
  //       return m.isGlutenFree == true && widget.favorites['isGlutenFree'] == true||
  //       m.isVegetarian == true && widget.favorites['isVegetarian'] ||
  //       m.isVegan == true && widget.favorites['isVegan'] ||
  //       m.isLactoseFree == true && widget.favorites['isLactoseFree']; 
  //     }).toList();
  //     return dummy;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // print(widget.favorites['isGlutenFree']);
    // print(widget.favorites['isVegetarian']);
    // print(widget.favorites['isVegan']);
    // print(widget.favorites['isLactoseFree']);
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.filtered.length} meals available'),
      ),
      // drawer: MDrawer(widget.setFilters),
      body: ListView.builder(
        itemBuilder: (ctx, index){
          return MeatItem(
            id: widget.filtered[index].id, 
            title: widget.filtered[index].title, 
            imageUrl: widget.filtered[index].imageUrl, 
            duration: widget.filtered[index].duration, 
            complexity: widget.filtered[index].complexity, 
            affordability: widget.filtered[index].affordability,
          );
        },
        itemCount: widget.filtered.length,
        )
    );
  }
}