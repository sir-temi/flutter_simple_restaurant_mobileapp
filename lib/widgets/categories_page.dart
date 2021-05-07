import 'package:flutter/material.dart';
import './original.dart';
import './category_item.dart';

class CategoriesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        children: 
          DUMMY_CATEGORIES.map((cat){
            return CategoryItem(cat.id, cat.title, cat.color);
          }).toList(),
        gridDelegate: 
        SliverGridDelegateWithMaxCrossAxisExtent(
          // width in px
          maxCrossAxisExtent: 200,
          // this is height to width radio
          // it means it will have a height of 200 *3/2 which is 300
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
      ),
    );
  }
}