import 'package:appproject/model/food_model.dart';
import 'package:appproject/model/panda_pick_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constants/base_url.dart';
import '../constants/local_status.dart';

class FoodLogic extends ChangeNotifier {
  FoodModel _foodModel = FoodModel(food: []);
  FoodModel get foodModel => _foodModel;

  FoodModel _pandaPick = FoodModel(food: []);
  FoodModel get pandaPick => _pandaPick;

  FoodModel _pandaExclusive = FoodModel(food: []);
  FoodModel get pandaExclusive => _pandaExclusive;

  LocalStatus _status = LocalStatus.none;
  LocalStatus get status => _status;

  void setLoading() {
    _status = LocalStatus.loading;
    notifyListeners();
  }

  Future read() async {
    final url = "http://$platform$port/mobile_project1/food/read.php";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _foodModel = await compute(getFoodModel, response.body);
        _status = LocalStatus.done;
      } else {
        print("Error while reading, ${response.statusCode}");
        _status = LocalStatus.error;
      }
    } catch (e) {
      print("Error while reading, ${e.toString()}");
      _status = LocalStatus.error;
    }
    notifyListeners();
  }

  Future readPandaPick() async {
    final url = "http://$platform$port/mobile_project1/food/read_from_pandapick.php";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _pandaPick = await compute(getFoodModel, response.body);
        _status = LocalStatus.done;
      } else {
        print("Error while reading, ${response.statusCode}");
        _status = LocalStatus.error;
      }
    } catch (e) {
      print("Error while reading, ${e.toString()}");
      _status = LocalStatus.error;
    }
    notifyListeners();
  }

  Future readPandaExclusives() async {
    final url = "http://$platform$port/mobile_project1/food/read_from_pandaexclusives.php";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _pandaExclusive = await compute(getFoodModel, response.body);
        _status = LocalStatus.done;
      } else {
        print("Error while reading, ${response.statusCode}");
        _status = LocalStatus.error;
      }
    } catch (e) {
      print("Error while reading, ${e.toString()}");
      _status = LocalStatus.error;
    }
    notifyListeners();
  }

}