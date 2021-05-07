import 'package:flutter/material.dart';
import './category_detail_page.dart';


class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;

  CategoryItem(this.id, this.title, this.bgColor);

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_){
          return CategroyDetailPage(id, title);
      }
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return InkWell(
          onTap: () => selectCategory(context),
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              bgColor.withOpacity(0.70),
              bgColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            ),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontSize: curScaleFactor * 23,
            ),
            )
        ),
      ),
    );
  }
}