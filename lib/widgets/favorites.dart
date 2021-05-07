import 'package:flutter/material.dart';
import './meal_item.dart';
import './original.dart';

class Favorites extends StatelessWidget {
  final List favorites;
  Favorites(this.favorites);
  static const routeName = '/favorties';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:favorites.isEmpty
        ? Text('No favorite added')
        : favorites.length == 1
          ? Text('${favorites.length} favorite')
          : Text('${favorites.length} favorites')
        ,
        ),
      body: favorites.isEmpty
          ? Center(
              child: Text('You have no favorites yet'),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return MeatItem(
                  id: favorites[index].id,
                  title: favorites[index].title,
                  imageUrl: favorites[index].imageUrl,
                  duration: favorites[index].duration,
                  complexity: favorites[index].complexity,
                  affordability: favorites[index].affordability,
                );
              },
              itemCount: favorites.length,
            ),
    );
  }
}
