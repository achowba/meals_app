import 'package:flutter/material.dart';

import './../data/dummy-data.dart';

class MealDetailScreen extends StatelessWidget {

    static const routeName = '/meal-detail'; // pass the routeName as a static variable

    Widget buildSectionTitle(BuildContext ctx, String text) {
        return Container(
            margin: EdgeInsets.symmetric(
                vertical: 10
            ),
            child: Text(
                text,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
            ),
        );
    }

    Widget buildContainer(Widget child) {
        return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 200,
            width: 300,
            child: child,
        );
    }

    @override
    Widget build (BuildContext context) {
        final mealId = ModalRoute.of(context).settings.arguments; // get the mealId from the route arguments
        final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

        return Scaffold(
            appBar: AppBar(
                title: Text('${selectedMeal.title}'),
                elevation: 0,
            ),
            body: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                        Container(
                            height: 300,
                            width: double.infinity,
                            child: Image.network(
                                selectedMeal.imageUrl,
                                fit: BoxFit.cover,
                            ),
                        ),
                        buildSectionTitle(context, 'Ingredients'),
                        buildContainer(
                            ListView.builder(
                                itemBuilder: (ctx, index) => Card(
                                    color: Theme.of(context).accentColor,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 10
                                        ),
                                        child: Text(selectedMeal.ingredients[index]),
                                    ),
                                ),
                                itemCount: selectedMeal.ingredients.length,
                            ),
                        ),
                        buildSectionTitle(context, 'Steps'),
                        buildContainer(ListView.builder(
                            itemBuilder: (ctx, index) =>
                                Column(
                                    children: <Widget>[
                                        ListTile(
                                            leading: CircleAvatar(
                                                child: Text(
                                                    '# ${(index + 1)}'
                                                ),
                                            ),
                                            title: Text(
                                                selectedMeal.steps[index]
                                            ),
                                        ),
                                        Divider()
                                    ],
                                ),
                                itemCount: selectedMeal.steps.length,
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
