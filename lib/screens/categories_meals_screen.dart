import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoriesMealsScreen(this.categoryId, this.categoryTitle);
  static const routeName = '/categories-meals';
  List<Meal> availabelMeals;

  CategoriesMealsScreen(this.availabelMeals);
  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedData = false;
  @override
  //we can't put this in initState as it loads too early and context doesn't
  //have value before as widget tree is yet to build
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'].toString();
      final id = routeArgs['id'];
      displayedMeals = widget.availabelMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      _loadedData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
