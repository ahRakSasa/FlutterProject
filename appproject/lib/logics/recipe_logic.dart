import 'dart:convert';
import 'dart:math';

import 'package:appproject/model/recipe_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constants/local_status.dart';

class RecipeLogic extends ChangeNotifier {
  List<RecipeModel> _recipeModels = [];
  List<RecipeModel> get recipeModels => _recipeModels;

  LocalStatus _status = LocalStatus.none;
  LocalStatus get status => _status;

  void setLoading() {
    _status = LocalStatus.loading;
    notifyListeners();
  }

  Future<void> read() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {
      "limit": "24",
      "start": "0",
    });

    try {
      final response = await http.get(uri, headers: {
        "X-RapidAPI-Key": "6003ace11emsh2f7d70cdacd9918p11f55djsnde6448aa709d",
        "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
        "useQueryString": "true"
      });

      if (response.statusCode == 200) {
        _status = LocalStatus.done;

        Map data = jsonDecode(response.body);
        List _temp = [];

        for (var i in data['feed']) {
          var element = i['content']['details'];
          if (element != null)
            if (element['name'] != null
                && element['rating'] != null
                && element['totalTime'] != null
                && element['images'][0]['hostedLargeUrl'] != null
            )
              _temp.add(element);
        }
        _recipeModels = RecipeModel.recipesFromSnapshot(_temp);
      } else {
        _status = LocalStatus.error;
        throw Exception("Something went wrong!, ${response.statusCode}");
      }
    } catch (e) {
      _status = LocalStatus.error;
      throw Exception("Something went wrong!, ${e.toString()}");
    }
  }

}