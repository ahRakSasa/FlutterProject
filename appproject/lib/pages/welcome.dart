import 'package:appproject/constants/constants.dart';
import 'package:appproject/pages/home.dart';
import 'package:appproject/pages/panda_pick_page.dart';
import 'package:appproject/pages/recipe/recipe_state_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bottom_utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int index = 2;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      drawer: _buildDrawer(),
      bottomNavigationBar: buildBottomNavigationBar(context, 2),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Food Lists',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      backgroundColor: Colors.orange,
      actions: [
        InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RecipeStatePage(),
                ),
              );
            },
            child: Icon(Icons.shopping_bag_outlined)),
        SizedBox(width: 10)
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: CupertinoTextField(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  placeholder: "Search for shop & restaurants",
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.search,
                      color: Color(0xff7b7b7b),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xfff7f7f7),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  style: TextStyle(
                    color: Color.fromARGB(255, 180, 28, 28),
                    fontSize: 12,
                    fontFamily: Regular,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .18,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image(
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2021/01/16/09/05/meal-5921491_960_720.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Food delivery',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: Bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Order from your faviruite\nrestaurants and home chefs',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    fontFamily: Medium,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "See more...",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        top: 5,
                        right: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .25,
                      decoration: BoxDecoration(
                        color: Colors.pink[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: const [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/pandamart.jpg'),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 0,
                              child: Text(
                                'pandamart',
                                style: TextStyle(
                                    color: blackColor,
                                    fontFamily: Bold,
                                    fontSize: 18),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Text(
                                'panda20 for 20% off',
                                style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                  fontFamily: Medium,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .15,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffef9fc4),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/food.jpg'),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.grey.withOpacity(0.2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pick-Up',
                                  style: TextStyle(
                                    color: blackColor,
                                    fontFamily: Bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Upto 50% off',
                                  style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    fontFamily: Medium,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: MediaQuery.of(context).size.height * .1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff85bfff),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shops',
                                  style: TextStyle(
                                    color: blackColor,
                                    fontFamily: Bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Everyday essentials',
                                  style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    fontFamily: Medium,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Your daily deals',
              style: TextStyle(
                color: Color(0xff323232),
                fontSize: 15,
                fontFamily: Bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * .278,
                child: PandaPickPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                  'https://media-exp1.licdn.com/dms/image/C5603AQFtuW78eNazIw/profile-displayphoto-shrink_800_800/0/1567442703746?e=2147483647&v=beta&t=N5dGxws3xJIhwPM8w_i4dlX8qLmxznmVykPCTccYHj8'),
            ),
          ),
          ListTile(
            title: const Text('Setting',
                style: TextStyle(fontFamily: Medium, color: Colors.black)),
            leading: Icon(
              Icons.settings_outlined,
              color: Colors.amber,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Help center 2',
                style: TextStyle(fontFamily: Medium, color: Colors.black)),
            leading: Icon(Icons.help_outline, color: Colors.amber),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('More',
                style: TextStyle(fontFamily: Medium, color: Colors.black)),
            leading: Icon(Icons.more_horiz, color: Colors.amber),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Quit',
                style: TextStyle(fontFamily: Medium, color: Colors.black)),
            leading: Icon(Icons.login_outlined, color: Colors.amber),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
