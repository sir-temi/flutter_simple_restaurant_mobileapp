import 'package:flutter/material.dart';
import '../models/meal.dart';
import './meal_detail.dart';

class MeatItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MeatItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability
  });

  String get complexityT{
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Challenging){
      return 'Challenging';
    } else if (complexity == Complexity.Hard) {
      return 'Hard';
    } else {
      return 'unknown';
    }
  }


  String get affordableT{
    if (affordability == Affordability.Affordable) {
      return 'Cheap';
    } else if (affordability == Affordability.Pricey){
      return 'Pricey';
    } else if (affordability == Affordability.Luxurious) {
      return 'Expensive';
    } else {
      return 'unknown';
    }
  }
  
  
  void showMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      MealDetail.routeName,
      arguments: id
    );
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final pWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => showMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                    ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    // this fits image well
                    fit: BoxFit.cover,
                    ),
                ),
                Positioned(
                  bottom: 20,
                  
                  // right: 10,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal:2),
                      width: pWidth * 0.8,
                      color: Colors.black26,
                      child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: curScaleFactor*25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      ),
                    ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 5,),
                      Text('$duration mins')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 5,),
                      Text('$complexityT')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 5,),
                      Text('$affordableT')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}