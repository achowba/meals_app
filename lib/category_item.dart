import 'package:flutter/material.dart';
import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {

    final String id;
    final String title;
    final Color color;

    CategoryItem(this.id, this.title, this.color);

    // method to navigate to another page
    void selectCategory(BuildContext ctx) {
        // Navigator needs a context, MaterialPageRoute needs a builder (which takes in a context)
        Navigator.of(ctx).pushNamed(
            CategoryMealsScreen.routeName,
            arguments: {
                'id': id,
                'title': title,
            }
        );
    }

    @override
    Widget build(BuildContext context) {
        return InkWell(
            onTap: () => selectCategory(context),
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(7),
            child: Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                    title,
                    style: Theme.of(context).textTheme.title,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [color.withOpacity(0.7), color],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                    ),
                    borderRadius: BorderRadius.circular(7)
                ),
            )
        );
    }
}
