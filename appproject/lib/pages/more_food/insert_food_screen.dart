import 'package:appproject/logics/my_food_logic.dart';
import 'package:appproject/model/my_food_model.dart';
import 'package:appproject/pages/profile_page.dart';
import 'package:appproject/pages/welcome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/snackBar.dart';
import '../../components/bottom_utils.dart';
import '../favorite_food_page.dart';
import '../notification.dart';

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
      bottomNavigationBar: buildBottomNavigationBar(context, 4),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Text("Insert food or drink", style: TextStyle(fontSize: 20)),
      actions: [
        IconButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              MyFood item = MyFood(
                id: "0",
                name: _nameCtrl.text.trim(),
                imageUrl: _imageCtrl.text.trim(),
                description: _descriptionCtrl.text.trim(),
              );
              bool success = await MyFoodLogic.insert(item);
              if (success) {
                await context.read<MyFoodLogic>().read();
                showSnackBar(context, "Item inserted");
                _nameCtrl.clear();
                _imageCtrl.clear();
                _descriptionCtrl.clear();
                setState(() {
                  _imageUrl = null;
                });
              } else {
                showSnackBar(context, "Something went wrong while inserting");
              }
            } else {
              showSnackBar(context, "All fields are required");
            }
          },
          icon: Icon(Icons.save_alt),
        ),
      ],
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildNameTextField(),
            _buildDescriptionTextField(),
            _buildImageTextField(),
            _buildImageBox(),
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
      decoration: InputDecoration(
        hintText: "Enter image url",
        suffixIcon: IconButton(
          icon: Icon(Icons.preview),
          onPressed: () {
            setState(() {
              _imageUrl = _imageCtrl.text;
            });
          },
        ),
      ),
      controller: _imageCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter an image url";
        }
        return null;
      },
    );
  }

  String? _imageUrl;

  Widget _buildImageBox() {
    if (_imageUrl == null) {
      return SizedBox();
    } else {
      return Container(
        height: 300,
        margin: EdgeInsets.all(20),
        child: Image.network(_imageCtrl.text.trim()),
      );
    }
  }
}
