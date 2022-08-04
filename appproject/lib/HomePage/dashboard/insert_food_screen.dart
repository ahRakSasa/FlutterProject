import 'package:appproject/HomePage/dashboard/profile_page.dart';
import 'package:appproject/HomePage/dashboard/welcome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'favorit_page.dart';
import 'notification.dart';

class InsertFoodScreen extends StatefulWidget {
  const InsertFoodScreen({Key? key}) : super(key: key);

  @override
  State<InsertFoodScreen> createState() => _InsertFoodScreenState();
}

class _InsertFoodScreenState extends State<InsertFoodScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Text("Insert food or drink", style: TextStyle(fontSize: 20)),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.save_alt),
        ),
      ],
    );
  }

  final _keyForm = GlobalKey<FormState>();

  Widget _buildBody() {
    return Form(
      key: _keyForm,
      child: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildNameTextField(),
            _buildDescriptionTextField(),
            _buildImageTextField(),
          ],
        ),
      ),
    );
  }

  var _nameCtrl = TextEditingController();
  var _descriptionCtrl = TextEditingController();
  var _imageCtrl = TextEditingController();


  Widget _buildNameTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "Enter food or drink name"),
      controller: _nameCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter a name";
        }
        return null;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "Enter description"),
      controller: _descriptionCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter a description";
        }
        return null;
      },
    );
  }

  Widget _buildImageTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "Enter image url"),
      controller: _imageCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter an image url";
        }
        return null;
      },
    );
  }


  int index = 4;

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
              MaterialPageRoute(builder: (context) => NotificationPage()));
        },
      ),
      InkWell(
        child: Icon(Icons.add, size: 30),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InsertFoodScreen()));
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
