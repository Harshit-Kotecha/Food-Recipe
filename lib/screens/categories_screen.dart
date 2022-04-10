import 'package:flutter/material.dart';
import 'package:meals/widgets/category_item.dart';
import 'package:meals/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //returning scaffold so that we can have diff. appbars for diff screens or routes
    return GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(catData.id, catData.title, catData.color),
          )
          .toList(),
      //Slivers are scrollable area on screen
      //SliverGridDelegateWithMaxCrossAxisExtent helps us in assigning max possible grid for items
      // ignore: prefer_const_constructors
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5, // 3 / 2 => height width ratio. here ratio is 3:2
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
