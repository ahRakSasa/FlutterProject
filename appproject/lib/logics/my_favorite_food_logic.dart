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
        print(response.body);
        _myFavoriteFoodModel = await compute(getFavoriteFoodModel, response.body);
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

  static Future<bool> delete(FavoriteFood item) async {
    final url = deleteFavoriteFood;
    try {
      http.Response response =
      await http.post(Uri.parse(url), body: item.toJson());
      if (response.statusCode == 200) {
        if (response.body.trim() == "delete_success") {
          return true;
        } else {
          return false;
        }
      } else {
        print("Error while reading, ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error while reading, ${e.toString()}");
      return false;
    }
  }

  static Future<bool> insert(String name, String imageUrl) async {
    FavoriteFood item = FavoriteFood(id: "", name: name, image: imageUrl);
    final url = insertFavoriteFood;
    try {
      http.Response response =
      await http.post(Uri.parse(url), body: item.toJson());
      print(item.toJson());
      if (response.statusCode == 200) {
        print("response.body: ${response.body}");
        if (response.body == "insert_success") {
          return true;
        } else {
          return false;
        }
      } else {
        print("Error while inserting, ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error while inserting, ${e.toString()}");
      return false;
    }
  }
}
