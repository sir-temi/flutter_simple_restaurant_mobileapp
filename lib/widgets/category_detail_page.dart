import 'package:flutter/material.dart';
import './original.dart';
import './meal_item.dart';


class CategroyDetailPage extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategroyDetailPage(this.categoryId, this.categoryTitle);


  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle Meal Category')
      ),
      body: ListView.builder(
      itemBuilder: (ctx, index) {
        return MeatItem(
          id: categoryMeals[index].id,
          title: categoryMeals[index].title, 
          imageUrl: categoryMeals[index].imageUrl, 
          duration: categoryMeals[index].duration, 
          complexity: categoryMeals[index].complexity, 
          affordability: categoryMeals[index].affordability,
          ); 
        },
      itemCount: categoryMeals.length
    ));
  }
}