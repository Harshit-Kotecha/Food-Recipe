import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    _filters = filterData;

    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors
            .amber, //foreground color for widgets like floating action button
        canvasColor: Color.fromRGBO(
            255, 254, 229, 1), //this can change color of scaffold widget
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: TabsScreen(),
      routes: {
        CategoriesMealsScreen.routeName: (ctx) => CategoriesMealsScreen(
            _availableMeals), //ctx is automatically created by flutter as arguments.
        //CategoriesMealsScreen passes 2 args but we pass them through navigator widget as
        //arguments in form of map and then extract them in another screen using modal route.,

        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilters),
      },
      //it loads when the generated route is not registered
      onGenerateRoute: (settings) {
        // if (settings.name == '/meal-detail') return ...;
        // else if()...
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
      //it is reached when flutter failed to build the screen provided all other measures.
      //it is the last resort like error 404 in web
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
