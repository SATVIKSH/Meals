import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/dummy_data.dart';

enum Filters { isGlutenFree, isLactoseFree, isVegan, isVegetarian }

class filtersNotifier extends StateNotifier<Map<Filters, bool>> {
  filtersNotifier()
      : super({
          Filters.isGlutenFree: false,
          Filters.isVegan: false,
          Filters.isVegetarian: false,
          Filters.isLactoseFree: false,
        });
  void setFilter(Filters filter, isActive) {
    state = {...state, filter: isActive};
  }

  void setAllFilters(Map<Filters, bool> filters) {
    state = filters;
  }
}

final filtersProvider =
    StateNotifierProvider<filtersNotifier, Map<Filters, bool>>((ref) {
  return filtersNotifier();
});

final filteredMealsProvider = Provider((ref) {
  var activeFilters = ref.watch(filtersProvider);
  return dummyMeals.where((element) {
    if (activeFilters[Filters.isGlutenFree]! && !element.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filters.isLactoseFree]! && !element.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filters.isVegetarian]! && !element.isVegetarian) {
      return false;
    }
    if (activeFilters[Filters.isVegan]! && !element.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
