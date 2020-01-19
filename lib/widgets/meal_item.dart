import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

import './../models/meal.dart';

class MealItem extends StatelessWidget {

    final String id;
    final String title;
    final String imageURL;
    final int duration;
    final Complexity complexity;
    final Affordability affordability;

    MealItem({
        @required this.id,
        @required this.title,
        @required this.imageURL,
        @required this.duration,
        @required this.complexity,
        @required this.affordability
    });

    String get complexityText {
        switch (complexity) {
            case Complexity.Simple:
                return 'Simple';
                break;
            case Complexity.Intermediate:
                return 'Intermediate';
                break;
            case Complexity.Hard:
                return 'Hard';
                break;
            default:
                return 'Unknown';
        }
    }

    String get affordabilityText {
        switch (affordability) {
            case Affordability.Affordable:
                return 'Affordable';
                break;
            case Affordability.Luxurious:
                return 'Luxurious';
                break;
            case Affordability.Pricey:
                return 'Expensive';
                break;
            default:
                return 'Unknown';
        }
    }

    void selectMeal(BuildContext ctx) {
        Navigator.of(ctx).pushNamed( // pass a named route with argument containing id of meal
            MealDetailScreen.routeName,
            arguments: id
        );
    }

    @override
    Widget build (BuildContext context) {
        return InkWell( // inkwell returns a widget that has a ripple effect on tap
            onTap: () => selectMeal(context),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                margin: EdgeInsets.all(10),
                child: Column(
                    children: <Widget>[
                        Stack( // stack is a widget that allows you to have content placed on top of each other
                            children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                    ),
                                    child: Image.network(
                                        imageURL,
                                        height: 250,
                                        width: double.infinity,
                                        fit: BoxFit.cover
                                    ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                        width: 350,
                                        color: Colors.black45,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 20,
                                        ),
                                        child: Text(
                                            title,
                                            style: TextStyle(
                                                fontSize: 26,
                                                color: Colors.white
                                            ),
                                            softWrap: true,
                                            overflow: TextOverflow.fade,
                                        ),
                                    ),
                                ),
                            ],
                        ),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                    Row(
                                        children: <Widget>[
                                            Icon(Icons.schedule),
                                            SizedBox(
                                                width: 6,
                                            ),
                                            Text('$duration min'),
                                        ],
                                    ),
                                    Row(
                                        children: <Widget>[
                                            Icon(Icons.work),
                                            SizedBox(
                                                width: 6,
                                            ),
                                            Text(complexityText),
                                        ],
                                    ),
                                    Row(
                                        children: <Widget>[
                                            Icon(Icons.attach_money),
                                            SizedBox(
                                                width: 6,
                                            ),
                                            Text(affordabilityText),
                                        ],
                                    ),
                                ],
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
