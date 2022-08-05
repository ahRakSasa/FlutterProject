import 'package:appproject/logics/recipe_logic.dart';
import 'package:appproject/model/recipe/recipe_model.dart';
import 'package:appproject/pages/recipe/recipe_card.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/local_status.dart';
import '../../utils/bottomnav_utils.dart';
import '../favorit_page.dart';
import '../more_food/more_added_food_page.dart';
import '../profile_page.dart';
import '../welcome.dart';

class RecipeStatePage extends StatefulWidget {
  const RecipeStatePage({Key? key}) : super(key: key);

  @override
  State<RecipeStatePage> createState() => _RecipeStatePageState();
}

class _RecipeStatePageState extends State<RecipeStatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(context, 3),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text('Food Recipe'),
        ],
      ),
      backgroundColor: Colors.orange,
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: Container(child: _buildLoading()),
    );
  }

  Widget _buildLoading() {
    LocalStatus status = context.watch<RecipeLogic>().status;
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
            context.read<RecipeLogic>().setLoading();
            await context.read<RecipeLogic>().read();
          },
          icon: Icon(Icons.refresh),
          label: Text("RETRY"),
        ),
      ],
    );
  }

  Widget _buildDisplay() {
    List<RecipeModel> _recipes = context.watch<RecipeLogic>().recipeModels;

    return RefreshIndicator(
      onRefresh: () async {
        print("refreshing");
        await context.read<RecipeLogic>().read();
      },
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            title: _recipes[index].name,
            cookTime: _recipes[index].totalTime,
            rating: _recipes[index].rating.toString(),
            thumbnailUrl: _recipes[index].image,
          );
        },
      ),
    );
  }
}
