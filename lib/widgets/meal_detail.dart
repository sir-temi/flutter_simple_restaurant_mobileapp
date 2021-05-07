import 'package:flutter/material.dart';
import './original.dart';

class MealDetail extends StatelessWidget {
  final Function addFav;
  final Function isFav;

  MealDetail({this.addFav, this.isFav});
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((m) {
      return m.id == id;
    });
    return Scaffold(
      appBar: AppBar(
          title: Text(meal.title.length < 30
              ? meal.title
              : meal.title.substring(0, 30) + ' ...')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Ingredients',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'merienda',
                  fontSize: 23,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(15),
              height: meal.ingredients.length < 6 ? 120 : 180,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Text(
                    meal.ingredients[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Steps',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'merienda',
                  fontSize: 23,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(top: 5, bottom: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              height: 300,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            (index + 1).toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        title: Text(
                          meal.steps[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  );
                },
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return Container(
            // margin: EdgeInsets.only(bottom: 40),
            child: FloatingActionButton(
                onPressed: () {
                  addFav(id);

                  final snackBar = SnackBar(
                      duration: const Duration(seconds: 2),
                      backgroundColor: Theme.of(context).accentColor,
                      content: Row(
                        children: <Widget>[
                          Icon(Icons.favorite),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            isFav(id) == true
                            ?'Added to favorites'
                            :'Removed from favorites',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ));
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: isFav(id) == true
                    ? Icon(Icons.favorite)
                    : Icon(Icons.star_border)),
          );
        },
      ),
    );
  }
}
