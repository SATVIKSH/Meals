import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouriteNotifier extends StateNotifier<List<Meal>> {
  FavouriteNotifier() : super([]);
  bool toggleFavourite(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, List<Meal>>((ref) {
  return FavouriteNotifier();
});
