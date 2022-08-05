import 'package:appproject/constants/constants.dart';
import 'package:appproject/pages/food_page.dart';
import 'package:appproject/pages/panda_exclusive_page.dart';
import 'package:appproject/pages/panda_pick_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
        text: 'Search for restaurant,cuisines, and dishes');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(height),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Food Delivery'),
      actions: const [
        Icon(Icons.shopping_bag_outlined),
        SizedBox(width: 10),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: CupertinoTextField(
                  controller: _textController,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  placeholder: "asdf",
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.search,
                      color: Color(0xff7b7b7b),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xfff7f7f7),
                      borderRadius: BorderRadius.circular(50)),
                  style: TextStyle(
                      color: Color(0xff707070),
                      fontSize: 12,
                      fontFamily: Regular),
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.filter_list_outlined,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(var height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: height,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Panda Pick',
                  style: TextStyle(
                    color: Color(0xff323232),
                    fontSize: 15,
                    fontFamily: Bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .278,
                    child: PandaPickPage(),
                  ),
                ),
                Text(
                  'Panda exclusives',
                  style: TextStyle(
                    color: Color(0xff323232),
                    fontSize: 15,
                    fontFamily: Bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .278,
                    child: PandaExclusivePage(),
                  ),
                ),
                Text(
                  'All Restaurant',
                  style: TextStyle(
                    color: Color(0xff323232),
                    fontSize: 15,
                    fontFamily: Bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: height * .5,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FoodPage(),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
