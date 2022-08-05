import 'package:appproject/constants/base_url.dart';
import 'package:appproject/constants/local_status.dart';
import 'package:appproject/model/more_food/favorite_food_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MyFavoriteFoodLogic extends ChangeNotifier {
  MyFavoriteFoodModel _myFavoriteFoodModel =
      MyFavoriteFoodModel(favoritefoods: []);
  MyFavoriteFoodModel get myfavoriteFoodModel => _myFavoriteFoodModel;

  LocalStatus _status = LocalStatus.none;
  LocalStatus get status => _status;

  void setLoading() {
    _status = LocalStatus.loading;
    notifyListeners();
  }

  Future read() async {
    const url = readFavoriteFood;
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _myFavoriteFoodModel = await compute(getProductModel, response.body);
        _status = LocalStatus.done;
      } else {
        print("Error while reading, code: ${response.statusCode}");
        _status = LocalStatus.error;
      }
    } catch (e) {
      print("Error while reading, ${e.toString()}");
      _status = LocalStatus.error;
    }
    notifyListeners();
  }
}
