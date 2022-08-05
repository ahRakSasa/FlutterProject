import 'dart:async';
import 'package:appproject/logics/my_favorite_food_logic.dart';
import 'package:appproject/logics/my_food_logic.dart';
import 'package:appproject/logics/recipe_logic.dart';
import 'package:appproject/pages/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/food_logic.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      await context.read<MyFoodLogic>().read();
      await context.read<RecipeLogic>().read();
<<<<<<< HEAD
      await context.read<MyFavoriteFoodLogic>().read();
=======
      await context.read<FoodLogic>().read();
      await context.read<FoodLogic>().readPandaPick();
      await context.read<FoodLogic>().readPandaExclusives();

>>>>>>> 8d19ae6635d3b45d5aab139d296be6f51bc7b272
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo1.jpg'),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: CupertinoActivityIndicator(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
