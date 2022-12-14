import 'package:appproject/model/more_food/my_food_model.dart';
import 'package:appproject/pages/detail_page.dart';
import 'package:appproject/pages/favorit_page.dart';
import 'package:appproject/pages/more_food/insert_food_screen.dart';
import 'package:appproject/pages/profile_page.dart';
import 'package:appproject/pages/recipe/recipe_state_page.dart';
import 'package:appproject/pages/welcome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'more_food/more_added_food_page.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int index = 3;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "New List",
        style: TextStyle(fontSize: 20),
      )),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: List.generate(
          20,
          (index) {
            return ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DetailPage(),
                //   ),
                // );
              },
              child: ListTile(
                
                leading: Image.network(
                  "https://i.guim.co.uk/img/media/a6795e6f75daa968c1154d4acedc091599c98474/0_299_4973_2984/master/4973.jpg?width=1200&quality=85&auto=format&fit=max&s=b641084777d2dedffc4dc6523078514d",
                  width: 40,
                ),
                title: Text("food name"),
                subtitle: Text("description"),
              ),
            );
          },
        ),
      ),
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
