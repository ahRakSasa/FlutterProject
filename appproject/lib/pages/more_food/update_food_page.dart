import 'package:appproject/logics/my_food_logic.dart';
import 'package:appproject/model/my_food_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/snackBar.dart';

class UpdateFoodPage extends StatefulWidget {
  // const UpdateProductPage({Key? key}) : super(key: key);
  final MyFood item;
  UpdateFoodPage(this.item);

  @override
  State<UpdateFoodPage> createState() => _UpdateFoodPageState();
}

class _UpdateFoodPageState extends State<UpdateFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Text("Update Product Page"),
      actions: [
        IconButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              MyFood item = MyFood(
                id: widget.item.id,
                name: _nameCtrl.text.trim(),
                imageUrl: _imageCtrl.text.trim(),
                description: _descriptionCtrl.text.trim(),
              );
              bool success = await MyFoodLogic.update(item);
              if (success) {
                await context.read<MyFoodLogic>().read();
                showSnackBar(context, "Item updated");
                Navigator.of(context).pop();
              } else {
                showSnackBar(context, "Something went wrong while updating");
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
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
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

  late var _nameCtrl = TextEditingController(text: widget.item.name);
  late var _imageCtrl = TextEditingController(text: widget.item.imageUrl);
  late var _descriptionCtrl = TextEditingController(text: widget.item.description);

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

  late var _imageUrl = widget.item.imageUrl;

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
