import 'package:flutter/material.dart';

import './../screens/categories_screen.dart';
import './../screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
    @override
    _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

    final List<Map<String, Object>> _pages = [
        {
            // set the page and title for each page
            'page': CategoriesScreen(),
            'title': 'Categories',
        },
        {
            'page': FavouriteScreen(),
            'title': 'Favourites',
        },
    ]; // list of pages to be switched to when a tab is selected

    int _selectedPageIndex = 0;

    void _selectPage (int index) {
        setState(() {
            _selectedPageIndex = index;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(_pages[_selectedPageIndex]['title']),
            ),
            body: _pages[_selectedPageIndex]['page'],
            bottomNavigationBar: BottomNavigationBar(
                onTap: _selectPage,
                backgroundColor: Theme.of(context).primaryColor,
                unselectedItemColor: Colors.black45,
                selectedItemColor: Colors.white,
                currentIndex: _selectedPageIndex,
                selectedFontSize: 18,
                // type: BottomNavigationBarType.shifting, // shifting adds a slight animation when switching tabs
                items: [ // items array to hold each tab
                    BottomNavigationBarItem(
                        // backgroundColor: Theme.of(context).primaryColor, // this is done if the tab type if SHIFTING
                        icon: Icon(Icons.category),
                        title: Text('Categories'),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.star),
                        title: Text('Favourites'),
                    ),
                ],
            ),
        );
    }
}
