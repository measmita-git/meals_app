import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex =0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _onTapped(){
    setState(() {
      _selectedPageIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activePageTitle ='Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(title: 'Favorites', meals: []);
      activePageTitle ='Your favorites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle),),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),

      ],),
    );
  }
}
