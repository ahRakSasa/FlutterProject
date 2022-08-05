import 'package:appproject/logics/food_logic.dart';
import 'package:appproject/model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/local_status.dart';
import '../components/restaurant.dart';

class PandaPickPage extends StatefulWidget {
  const PandaPickPage({Key? key}) : super(key: key);

  @override
  State<PandaPickPage> createState() => _PandaPickPageState();
}

class _PandaPickPageState extends State<PandaPickPage> {
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
    List<Food> pandaPickList =
        context.watch<FoodLogic>().pandaPick.food;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: pandaPickList.length,
      itemBuilder: (context, index) {
        return RestuarantScreen(
          name: pandaPickList[index].name,
          image: pandaPickList[index].image,
          remainingTime: pandaPickList[index].totalTime,
          totalRating: pandaPickList[index].rating,
          subTitle: pandaPickList[index].description,
          deliveryPrice: pandaPickList[index].deliveryPrice,
          deliveryTime: "",
          rating: "",
        );
      },
    );
  }
}
