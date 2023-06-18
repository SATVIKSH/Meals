import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Providers/favourite_provider.dart';
import 'package:meals/Providers/filters_provider.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  var selectedScreen = 'Meals';
  void changeScreen(String selectedScreen) async {
    Navigator.of(context).pop();
    if (selectedScreen == 'Filters') {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return const FiltersScreen();
      }));
    }
  }

  var _currentIndex = 0;
  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var activeMealsList = ref.watch(filteredMealsProvider);
    var favouriteList = ref.watch(favouriteProvider);
    Widget _currentScreen = CategoryScreen(
      activeList: activeMealsList,
    );
    var _currentTitle = "Categories";
    if (_currentIndex == 1) {
      _currentScreen = MealScreen(meals: favouriteList);
      _currentTitle = "Your Favourite Meals";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTitle),
      ),
      drawer: MainDrawer(
        onChangeScreen: changeScreen,
      ),
      body: _currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _changeIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
