import 'package:appproject/HomePage/dashboard/favorit_page.dart';
import 'package:appproject/HomePage/dashboard/notification.dart';
import 'package:appproject/HomePage/dashboard/welcome.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../login_Signup/screens/login_screen.dart';
import '../../login_Signup/screens/registration_screen.dart';

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
              MaterialPageRoute(builder: (context) => NotificationPage()));
        },
      ),
      InkWell(
        child: Icon(Icons.add, size: 30),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
      ),
    ];
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "profile",
        style: TextStyle(fontSize: 20),
      )),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(items),
    );
  }

  Widget _buildBody() {
    return Container(
      // margin: EdgeInsets.fromLTRB(130, 20, 0, 0),
      // color: Colors.red,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 45,
              backgroundColor: Colors.black,
              child: Icon(Icons.person, color: Colors.white, size: 50),
            ),
            Text(
              "Name",
              style: TextStyle(fontSize: 30),
            ),
            Text('Description'),
            SizedBox(
              height: 10,
            ),
            _buildGrid()
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 4/6,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.black,
        );
      },
    );
  }

  CurvedNavigationBar _buildBottomNavigationBar(List<Widget> items) {
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
