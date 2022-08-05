import 'package:appproject/constants/constants.dart';
import 'package:appproject/logics/my_favorite_food_logic.dart';
import 'package:appproject/logics/my_food_logic.dart';
import 'package:appproject/model/more_food/favorite_food_model.dart';
import 'package:appproject/model/more_food/my_food_model.dart';
import 'package:appproject/pages/favorit_page.dart';
import 'package:appproject/pages/recipe/recipe_state_page.dart';
import 'package:appproject/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'more_food/more_added_food_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
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
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "profile",
        style: TextStyle(fontSize: 20),
      )),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(items),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            maxRadius: 45,
            backgroundColor: Colors.black,
            child: Icon(Icons.person, color: Colors.white, size: 50),
          ),
          const Text(
            "Name",
            style: TextStyle(fontSize: 30),
          ),
          const Text('Description'),
          const SizedBox(
            height: 10,
          ),
          _buildGrid()
        ],
      ),
    );
  }




  Widget _buildGrid() {
    List<MyFood> myfoodlist = context.watch<MyFoodLogic>().myFoodModel.myFood;
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 4 / 6,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: myfoodlist.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white70,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: GridTile(
              child: Image.network(
                myfoodlist[index].imageUrl,
                fit: BoxFit.cover,
              ),
              footer: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Title(
                      color: blackColor,
                      child: Text(
                        myfoodlist[index].name,
                        maxLines: 1,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      myfoodlist[index].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  CurvedNavigationBar _buildBottomNavigationBar(List<Widget> items) {
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
