import 'package:appproject/pages/recipe/recipe_state_page.dart';
import 'package:flutter/material.dart';
import 'package:appproject/pages/more_food/insert_food_screen.dart';
import 'package:appproject/pages/notification.dart';
import 'package:appproject/pages/profile_page.dart';
import 'package:appproject/pages/welcome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'more_food/more_added_food_page.dart';

class FavoritPage extends StatefulWidget {
  FavoritPage({Key? key}) : super(key: key);

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Favorite Food",
        style: TextStyle(fontSize: 20),
      )),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(7),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 7, crossAxisSpacing: 7),
        children: List.generate(
          21,
          (index) {
            return Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GridTile(
                  child: Image.network(
                    "https://codeprojects.org/Sh1SkfTBmbcc7QGUwE_c4VFE9BXiJZvAFSRYwxSR98Q/Fast-food.jpg",
                    fit: BoxFit.cover,
                  ),
                  footer: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Text(
                          "food namelkdfa;fafrowruna",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          
                          child: Icon(Icons.favorite,color: Colors.red,))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // child: GridTile(child: Container(color: Colors.black,child: Icon(Icons.abc),),),
    );
  }

  CurvedNavigationBar _buildBottomNavigationBar() {
    final items = <Widget>[
      InkWell(
        child: Icon(Icons.person, size: 30),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
      InkWell(
        child: Icon(Icons.favorite, size: 30),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FavoritPage()));
        },
      ),
      InkWell(
        child: Icon(Icons.home, size: 30),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()));
        },
      ),
      InkWell(
        child: Icon(Icons.notifications_active, size: 30),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RecipeStatePage()));
        },
      ),
      InkWell(
        child: Icon(Icons.list, size: 30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MoreAddedFoodPage(),
            ),
          );
        },
      ),
    ];
    return CurvedNavigationBar(
      color: Colors.amber,
      buttonBackgroundColor: Color.fromARGB(255, 31, 211, 211),
      backgroundColor: Colors.white,
      items: items,
      index: index,
      height: 60,
      onTap: (index) => setState(() => this.index = index),
    );
  }
}
