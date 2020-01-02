import 'package:flutter/material.dart';

import './dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {

    // pass data between routes via the constructor
    /* final String categoryId;
    final String categoryTitle;

    CategoryMealsScreen(this.categoryId, this.categoryTitle); */
    static const routeName = '/categories-meals';

    @override
    Widget build (BuildContext context) {

        final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>; // use the ModalRoute class to extract route parameters/arguments
        final categoryId = routeArgs['id'];
        final categoryTitle = routeArgs['title'];
        final categoryMeals = DUMMY_MEALS.where((meal) {
            return meal.categories.contains(categoryId);
        }).toList();

        return Scaffold(
            appBar: AppBar(
                title: Text(categoryTitle),
            ),
            body: ListView.builder(itemBuilder: (ctx, index) {
                return Text(categoryMeals[index].title);
            },itemCount: categoryMeals.length,),
        );
    }
}
