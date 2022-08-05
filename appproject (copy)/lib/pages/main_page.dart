import 'package:appproject/components/restaurant.dart';
import 'package:appproject/pages/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Mainpage extends StatefulWidget {
 const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _buildBody(),
      bottomNavigationBar: _BuildBottom(),
      endDrawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.face, size: 100),
          ),
          Divider(color: Colors.white),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            textColor: Colors.white,
            iconColor: Colors.white,
            trailing: Icon(Icons.navigate_next),
          )
        ],
      ),
    );
  }

  PageController _pageController = PageController();

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },

      children: [
        //  WelcomeScreen(),
        
      ],

      // children: [
      //   Container(color: Colors.blue),
      //   Container(color: Colors.green),
      //   Container(color: Colors.red),
      //   Container(color: Colors.amber),
      // ],
    );
  }

  int _currentIndex = 2;

  Widget _BuildBottom() {
    return BottomNavigationBar(
      //  currentIndex: 3,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        _pageController.jumpToPage(_currentIndex);
      },

      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: Colors.black54,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person,size: 30,), label: "Profile"),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow_sharp,size: 30,), label: "Play"),
        BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,), label: "Home"),
        // BottomNavigationBarItem(icon: Icon(Icons.chat,size: 30,), label: "Chat"),
        // BottomNavigationBarItem(icon: Icon(Icons.menu,size: 30,), label: "Menu"),
      ],
    );
  }
}
