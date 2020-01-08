import 'package:flutter/material.dart';

import './../widgets/meal_item.dart';
import './../data/dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {

    // pass data between routes via the constructor
    /* final String categoryId;
    final String categoryTitle;

    CategoryMealsScreen(this.categoryId, this.categoryTitle); */
    static const routeName = '/categories-meals';

    @override
    Widget build (BuildContext context) {

        final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>; // use the ModalRoute class to extract route parameters/arguments
        final categoryId = routeArgs['id']; // extract the categoryId from the route parameters/arguments
        final categoryTitle = routeArgs['title']; // extract the categoryTitle from the route parameters/arguments
        final categoryMeals = DUMMY_MEALS.where((meal) {
            return meal.categories.contains(categoryId);
        }).toList();

        return Scaffold(
            appBar: AppBar(
                title: Text(categoryTitle),
            ),
            body: ListView.builder(itemBuilder: (ctx, index) {
                return MealItem(
                    id: categoryMeals[index].id,
                    title: categoryMeals[index].title,
                    imageURL: categoryMeals[index].imageUrl,
                    duration: categoryMeals[index].duration,
                    complexity: categoryMeals[index].complexity,
                    affordability: categoryMeals[index].affordability,
                );
            },itemCount: categoryMeals.length,),
        );
    }
}
