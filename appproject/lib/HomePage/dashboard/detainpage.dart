import 'package:flutter/material.dart';

class DetainPage extends StatefulWidget {
  DetainPage({Key? key}) : super(key: key);

  @override
  State<DetainPage> createState() => _DetainPageState();
}

class _DetainPageState extends State<DetainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network("https://i.guim.co.uk/img/media/a6795e6f75daa968c1154d4acedc091599c98474/0_299_4973_2984/master/4973.jpg?width=1200&quality=85&auto=format&fit=max&s=b641084777d2dedffc4dc6523078514d"),
            SizedBox(height: 10,),
            Title(color: Colors.black, child: Text("Food Name"),),
            Text("Some Description"),
          ],
        ),
      ),
    );
  }
}
