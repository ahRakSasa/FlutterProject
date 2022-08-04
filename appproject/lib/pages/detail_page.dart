import 'package:appproject/model/more_food/my_food_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  // DetailPage({Key? key}) : super(key: key);

  final MyFood item;

  DetailPage(this.item);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(widget.item.imageUrl),
            SizedBox(
              height: 10,
            ),
            Title(
              color: Colors.black,
              child: Text(
                "${widget.item.name}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "${widget.item.description}",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
