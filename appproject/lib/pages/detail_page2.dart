import 'package:appproject/constants/constants.dart';
import 'package:appproject/logics/recipe_logic.dart';
import 'package:appproject/model/recipe/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class DetailPage2 extends StatefulWidget {
  final String name, image;

  const DetailPage2({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  _DetailPage2State createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    List<RecipeModel> _recipes = context.watch<RecipeLogic>().recipeModels;

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: false,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  stretchModes: [StretchMode.blurBackground],
                  title: Text(
                    widget.name,
                    style: TextStyle(color: Colors.amber),
                    textAlign: TextAlign.left,
                  ),
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        width: double.infinity,
                        color: Colors.grey,
                        child: Image(
                            fit: BoxFit.cover, image: AssetImage(widget.image)),
                      ),
                      /*Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.name,
                          style: TextStyle(fontSize: 25.0),
                          textAlign: TextAlign.left,
                        ),
                      ),*/
                    ],
                  ),
                ),
                expandedHeight: 250.0,
              ),
            ];
          },
          body: ScrollableListTabView(
            tabHeight: 50,
            bodyAnimationDuration: const Duration(milliseconds: 800),
            tabAnimationCurve: Curves.ease,
            tabAnimationDuration: const Duration(milliseconds: 150),
            style:
                TextStyle(color: Colors.green, fontFamily: Bold, fontSize: 25),
            tabs: [
              ScrollableListTab(
                tab: const ListTab(
                  label: Text(
                    'Popular',
                    style: TextStyle(fontFamily: Bold),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  activeBackgroundColor: Colors.amber,
                  borderColor: Colors.amber,
                ),
                body: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          _recipes[index].name,
                          style: const TextStyle(fontFamily: Bold),
                        ),
                        subtitle: Text("Total Time - ${_recipes[index].totalTime}"),
                        trailing: Container(
                          height: 80,
                          width: 80,
                          alignment: Alignment.center,
                          child: Image(image: NetworkImage(_recipes[index].image)),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("${_recipes[index].rating}K"),
                          ),
                          Container(
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffeab676).withOpacity(0.5)),
                            child: Center(
                              child: Text(
                                '🔥 Popular',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: blackColor,
                                  fontFamily: Medium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                ),
              ),
              ScrollableListTab(
                tab: const ListTab(
                  label: Text(
                    'Favourite',
                    style: TextStyle(fontFamily: Bold),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  activeBackgroundColor: Colors.amber,
                  borderColor: Colors.amber,
                  inactiveBackgroundColor: Colors.white,
                ),
                body: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) => Card(
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(_recipes[index + 9].image),
                        ),
                        Positioned(
                          top: 0,
                          left: 5,
                          child: Container(
                            color: Colors.grey.withOpacity(0.4),
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(8.0),
                            child: Text(
                              'Favorite Deal ${index + 1}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                fontFamily: Bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xfffffcff),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Text(
                                  "${_recipes[index].rating}K",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: 12,
                                      fontFamily: Bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
