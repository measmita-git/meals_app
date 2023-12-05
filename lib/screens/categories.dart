import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';

import 'package:meals_app/widgets/category_grid_item.dart';

import '../models/category.dart';


class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context,Category category) {
    final filteredMeals=dummyMeals.where((meals) => meals.categories.contains(category.id)).toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MealsScreen(title:category.title, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(12.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category,onSelectCategory: (){
              _selectCategory(context,category);
            },),

        ],
      );


  }

}