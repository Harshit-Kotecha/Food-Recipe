import 'package:flutter/material.dart';

import '/screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({Key? key}) : super(key: key);
  final String id;
  final String title;
  final Color color;

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoriesMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  CategoryItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    //InkWell is a gesture detector that also fire ripple effect like waves comes out when you click
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius:
          BorderRadius.circular(15), //because our card also has that radius
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        //we aren't adding margin here. instead add pading in grid view
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.70),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
