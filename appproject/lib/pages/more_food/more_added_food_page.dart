import 'package:appproject/logics/my_food_logic.dart';
import 'package:appproject/model/more_food/my_food_model.dart';
import 'package:appproject/pages/detail_page.dart';
import 'package:appproject/pages/more_food/insert_food_screen.dart';
import 'package:appproject/pages/profile_page.dart';
import 'package:appproject/pages/welcome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../constants/local_status.dart';
import '../favorit_page.dart';
import '../notification.dart';

class MoreAddedFoodPage extends StatefulWidget {
  const MoreAddedFoodPage({Key? key}) : super(key: key);

  @override
  State<MoreAddedFoodPage> createState() => _MoreAddedFoodPageState();
}

class _MoreAddedFoodPageState extends State<MoreAddedFoodPage> {
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
      title: Text("Your food list", style: TextStyle(fontSize: 20)),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InsertFoodScreen(),
              ),
            );
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: Container(child: _buildLoading()),
    );
  }

  Widget _buildLoading() {
    LocalStatus status = context.watch<MyFoodLogic>().status;
    switch (status) {
      case LocalStatus.none:
      case LocalStatus.loading:
        return CircularProgressIndicator();
      case LocalStatus.error:
        return _buildError();
      case LocalStatus.done:
        return _buildDisplay();
    }
  }

  Widget _buildError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error, size: 30),
        Text("No internet connection", style: TextStyle(fontSize: 20)),
        Text("or something went wrong!", style: TextStyle(fontSize: 20)),
        ElevatedButton.icon(
          onPressed: () async {
            context.read<MyFoodLogic>().setLoading();
            await context.read<MyFoodLogic>().read();
          },
          icon: Icon(Icons.refresh),
          label: Text("RETRY"),
        ),
      ],
    );
  }

  PageController _pageController = PageController();

  Widget _buildDisplay() {
    List<MyFood> myFoodList = context.watch<MyFoodLogic>().myFoodModel.myFood;

    return ListView.builder(
      controller: _pageController,
      physics: BouncingScrollPhysics(),
      itemCount: myFoodList.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(myFoodList[index]),
                ),
              );
            },
            child: _buildItem(myFoodList[index]));
      },
    );
  }

  Widget _buildItem(MyFood item) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 1 / 4,
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx) {},
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: "Archive",
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx) {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => UpdateProductPage(item),
              //   ),
              // );
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (ctx) async {
              bool success = await MyFoodLogic.delete(item);
              if (success) {
                await context.read<MyFoodLogic>().read();
              } else {
                print("Delete Failed");
              }
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          leading: Image.network(item.imageUrl),
          title: Text("${item.name}"),
        ),
      ),
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
        child: Icon(Icons.list, size: 30),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MoreAddedFoodPage()));
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
