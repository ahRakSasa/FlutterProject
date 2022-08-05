import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../pages/favorit_page.dart';
import '../pages/more_food/more_added_food_page.dart';
import '../pages/profile_page.dart';
import '../pages/recipe/recipe_state_page.dart';
import '../pages/welcome.dart';

CurvedNavigationBar buildBottomNavigationBar(BuildContext context, int current) {
  final items = <Widget>[
    const Icon(Icons.person, size: 30),
    const Icon(Icons.favorite, size: 30),
    const Icon(Icons.home, size: 30),
    const Icon(Icons.notifications_active),
    const Icon(Icons.list, size: 30),
  ];
  
  final List<Widget> pages = [
    ProfilePage(),
    FavoritePage(),
    WelcomeScreen(),
    RecipeStatePage(),
    MoreAddedFoodPage(),
  ];
  
  return CurvedNavigationBar(
    color: Colors.orange,
    buttonBackgroundColor: const Color.fromARGB(255, 31, 211, 211),
    backgroundColor: Colors.amber,
    items: items,
    index: current,
    height: 60,
    onTap: (index) {
      current = index;
      print("pushing");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => pages[current]));
    }
  );
}
