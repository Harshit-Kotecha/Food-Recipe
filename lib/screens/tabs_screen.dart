import 'package:flutter/material.dart';
import 'package:meals/main_drawer.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavouriteScreen(),
      'title': 'Favourites',
    }
  ];
  int selectedPageIndex = 0;

  void selectPage(int index) {
    //index automatically provided by flutter.. we don't need to pass it
    setState(
      () {
        selectedPageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: selectedPageIndex,
          //type: BottomNavigationBarType.shifting,  =>>>can be used to change animation by default it is fixed
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favourites',
            ),
          ]),
    );
  }
}
