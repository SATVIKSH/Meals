import 'package:flutter/material.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widgets/category_item.dart';
import 'package:meals/models/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.activeList});
  final List<Meal> activeList;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  //Change Screen Logic
  late AnimationController animationController;
  void changeScreen(Category category, BuildContext context) {
    var mealsList = widget.activeList.where((element) {
      for (final item in element.categories) {
        if (category.id == item) {
          return true;
        }
      }
      return false;
    }).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) {
          return MealScreen(title: category.title, meals: mealsList);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    animationController.forward();
  }

  //
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        children: [
          for (final category in availableCategories)
            CategoryItem(
              category: category,
              changeScreen: changeScreen,
            ),
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: animationController, curve: Curves.easeInOut)),
        child: child,
      ),
    );
  }
}
