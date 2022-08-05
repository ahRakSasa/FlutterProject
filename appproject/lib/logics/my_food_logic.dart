import 'package:appproject/constants/local_status.dart';
import 'package:appproject/model/more_food/my_food_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constants/base_url.dart';

class MyFoodLogic extends ChangeNotifier {
  MyFoodModel _myFoodModel = MyFoodModel(myFood: []);
  MyFoodModel get myFoodModel => _myFoodModel;

  LocalStatus _status = LocalStatus.none;
  LocalStatus get status => _status;

  void setLoading() {
    _status = LocalStatus.loading;
    notifyListeners();
  }

  Future read() async {
    final url = readUrl;
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print(response.body);
        _myFoodModel = await compute(getProductModel, response.body);
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

  static Future<bool> delete(MyFood item) async {
    final url = deleteUrl;
    try {
      http.Response response =
          await http.post(Uri.parse(url), body: item.toJson());
      if (response.statusCode == 200) {
        print("response.body: ${response.body}");
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

  static Future<bool> insert(MyFood item) async {
    final url = insertUrl;
    try {
      http.Response response =
          await http.post(Uri.parse(url), body: item.toJson());
      if (response.statusCode == 200) {
        print("response.body: ${response.body}");
        if (response.body == "insert_success") {
          return true;
        } else {
          return false;
        }
      } else {
        print("Error while reading, ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error while inserting, ${e.toString()}");
      return false;
    }
  }

  static Future<bool> update(MyFood item) async {
    final url = updateUrl;
    try {
      http.Response response =
          await http.post(Uri.parse(url), body: item.toJson());
      if (response.statusCode == 200) {
        print("response.body: ${response.body}");
        if (response.body.trim() == "update_success") {
          return true;
        } else {
          return false;
        }
      } else {
        print("Error while updating, ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error while updating, ${e.toString()}");
      return false;
    }
  }
}
