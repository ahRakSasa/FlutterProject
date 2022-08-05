<<<<<<< HEAD
import 'package:appproject/logics/my_favorite_food_logic.dart';
=======
import 'package:appproject/logics/food_logic.dart';
>>>>>>> 8d19ae6635d3b45d5aab139d296be6f51bc7b272
import 'package:appproject/logics/my_food_logic.dart';
import 'package:appproject/logics/panda_pick_logic.dart';
import 'package:appproject/logics/recipe_logic.dart';
import 'package:appproject/model/panda_pick_model/panda_pick_model.dart';
import 'package:appproject/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:appproject/constants/color.dart';
import 'package:appproject/constants/constants.dart';
import 'package:provider/provider.dart';

import 'constants/color.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyFoodLogic()),
        ChangeNotifierProvider(create: (context) => RecipeLogic()),
<<<<<<< HEAD
        ChangeNotifierProvider(create: (context) => MyFavoriteFoodLogic()),
=======
        ChangeNotifierProvider(create: (context) => FoodLogic()),
>>>>>>> 8d19ae6635d3b45d5aab139d296be6f51bc7b272
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark(),
        theme: ThemeData(
            primarySwatch: MyColors.navy,
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.amber,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.amber,
                elevation: .2,
                titleTextStyle: TextStyle(fontFamily: Bold, color: Colors.white),
                iconTheme: IconThemeData(color: Colors.white))),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: MyColors.navy,
            scaffoldBackgroundColor: const Color(0xfffcfcfc),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: .2,
                titleTextStyle: TextStyle(fontFamily: Bold, color: Colors.white),
                iconTheme: IconThemeData(color: Colors.white))),
        home: SplashScreen(),
      ),
    );
  }
}
