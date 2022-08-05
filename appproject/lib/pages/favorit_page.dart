import 'package:appproject/constants/constants.dart';
import 'package:appproject/logics/my_favorite_food_logic.dart';
import 'package:appproject/model/more_food/favorite_food_model.dart';
import 'package:appproject/pages/recipe/recipe_state_page.dart';
import 'package:flutter/material.dart';
import 'package:appproject/pages/profile_page.dart';
import 'package:appproject/pages/welcome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'more_food/more_added_food_page.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({Key? key}) : super(key: key);

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
 
  int index = 1;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Favorite Food",
        style: TextStyle(fontSize: 20),
      )),
      body: _buildGrid(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildGrid() {
    List<favoritefood> myfavortifood =
        context.watch<MyFavoriteFoodLogic>().myfavoriteFoodModel.favoritefoods;
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 4 / 6,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: myfavortifood.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white70,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: GridTile(
              footer: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Title(
                          color: blackColor,
                          child: Text(
                            myfavortifood[index].name,
                            maxLines: 1,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          myfavortifood[index].description,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    right: 2,
                    bottom: 5,
                    child: InkWell(child: Icon(Icons.favorite, color: Colors.red),),
                  ),
                ],
              ),
              child: Image.network(
                myfavortifood[index].image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  CurvedNavigationBar _buildBottomNavigationBar() {
    final items = <Widget>[
      InkWell(
        child: const Icon(Icons.person, size: 30),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
      InkWell(
        child: const Icon(Icons.favorite, size: 30),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const FavoritPage()));
        },
      ),
      InkWell(
        child: const Icon(Icons.home, size: 30),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()));
        },
      ),
      InkWell(
        child: const Icon(Icons.notifications_active, size: 30),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RecipeStatePage()));
        },
      ),
      InkWell(
        child: const Icon(Icons.list, size: 30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MoreAddedFoodPage(),
            ),
          );
        },
      ),
    ];
    return CurvedNavigationBar(
      color: Colors.amber,
      buttonBackgroundColor: const Color.fromARGB(255, 31, 211, 211),
      backgroundColor: Colors.white,
      items: items,
      index: index,
      height: 60,
      onTap: (index) => setState(() => this.index = index),
    );
  }
}
