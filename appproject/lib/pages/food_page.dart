import 'package:appproject/logics/food_logic.dart';
import 'package:appproject/model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/local_status.dart';
import '../components/restaurant.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: _buildLoading(),
    );
  }

  Widget _buildLoading() {
    LocalStatus status = context.watch<FoodLogic>().status;
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
            context.read<FoodLogic>().setLoading();
            await context.read<FoodLogic>().read();
          },
          icon: Icon(Icons.refresh),
          label: Text("RETRY"),
        ),
      ],
    );
  }

  Widget _buildDisplay() {
    List<Food> foodList =
        context.watch<FoodLogic>().foodModel.food;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: foodList.length,
      itemBuilder: (context, index) {
        return RestuarantScreen(
          name: foodList[index].name,
          image: foodList[index].image,
          remainingTime: foodList[index].totalTime,
          totalRating: foodList[index].rating,
          subTitle: foodList[index].description,
          deliveryPrice: foodList[index].deliveryPrice,
          deliveryTime: "",
          rating: "",
        );
      },
    );
  }
}
