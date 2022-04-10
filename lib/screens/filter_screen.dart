import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function saveFilters;
  Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;

    super.initState();
  }

  Widget _buildListTile(
      String title, String description, var currentVal, update) {
    return SwitchListTile(
      title: Text(title),
      value: currentVal,
      subtitle: Text(description),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meals',
                style: Theme.of(context).textTheme.subtitle1),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(
                  'Gluten-Free',
                  'Include only gluten free meals',
                  _glutenFree,
                  (newValue) {
                    //provided by flutter automatically
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildListTile(
                  'Lactose-Free',
                  'Include only lactose free meals',
                  _lactoseFree,
                  (newValue) {
                    //provided by flutter automatically
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildListTile(
                  'Vegan',
                  'Include only vegan meals',
                  _vegan,
                  (newValue) {
                    //provided by flutter automatically
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _buildListTile(
                  'Vegetarian',
                  'Include only vegetarian meals',
                  _vegetarian,
                  (newValue) {
                    //provided by flutter automatically
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
