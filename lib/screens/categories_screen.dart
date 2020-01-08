import 'package:flutter/material.dart';

import './../data/dummy-data.dart';
import './../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
    const CategoriesScreen({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return GridView(
            padding: const EdgeInsets.all(15),
            children: DUMMY_CATEGORIES.map((catData) =>
                CategoryItem(catData.id, catData.title, catData.color)
            ).toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( // this class takes care of structuring the grid
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
            ),
        );
    }
}
