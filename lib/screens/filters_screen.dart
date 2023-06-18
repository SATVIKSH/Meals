import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            contentPadding: const EdgeInsets.only(left: 22, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filters.isGlutenFree]!,
            onChanged: (isGlutenFree) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.isGlutenFree, isGlutenFree),
            title: Text(
              "Gluten Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text("Diplay meals which are gluten free",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
          SwitchListTile(
            contentPadding: const EdgeInsets.only(left: 22, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filters.isLactoseFree]!,
            onChanged: (isLactoseFree) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.isLactoseFree, isLactoseFree),
            title: Text(
              "Lactose Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text("Diplay meals which are Lactose free",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
          SwitchListTile(
            contentPadding: const EdgeInsets.only(left: 22, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filters.isVegan]!,
            onChanged: (isVegan) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.isVegan, isVegan),
            title: Text(
              "Vegan",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text("Diplay meals which is Vegan",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
          SwitchListTile(
            contentPadding: const EdgeInsets.only(left: 22, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filters.isVegetarian]!,
            onChanged: (isVegetarian) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filters.isVegetarian, isVegetarian),
            title: Text(
              "Vegetarian",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text("Diplay meals which is Vegetarian",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
        ],
      ),
    );
  }
}
