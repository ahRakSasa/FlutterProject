import 'package:appproject/constants/constants.dart';
import 'package:appproject/logics/my_food_logic.dart';
import 'package:appproject/model/my_food_model.dart';
import 'package:appproject/pages/detail_page.dart';
import 'package:appproject/components/bottom_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "profile",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.orange,
      ),
      body: _buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(context, 0),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white30.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
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
              ],
            ),
          ),
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
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 6 / 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: myfoodlist.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  myfoodlist[index],
                ),
              ),
            );
          },
          child: Container(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Title(
                        color: blackColor,
                        child: Text(
                          myfoodlist[index].name,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
