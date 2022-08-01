import 'package:appproject/HomePage/dashboard/favorit_page.dart';
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
        child: Icon(Icons.search, size: 30),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegistrationScreen()));
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
      margin: EdgeInsets.fromLTRB(130, 20, 0, 0),
      // color: Colors.red,
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                color: (Colors.green),
                borderRadius: BorderRadius.circular(120)),
          ),
          Text(
            "Name",
            style: TextStyle(fontSize: 30),
          ),
          Text('Description'),
          
        ],
        
      ),
      
    
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
