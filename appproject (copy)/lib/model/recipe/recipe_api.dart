import 'dart:convert';
import 'recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  /*
  * onst req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

req.query({
	"limit": "24",
	"start": "0"
});

req.headers({
	"X-RapidAPI-Key": "6003ace11emsh2f7d70cdacd9918p11f55djsnde6448aa709d",
	"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
	"useQueryString": true
});
  * */

  static Future<List<RecipeModel>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {
      "limit": "24",
      "start": "0",
    });

    try {
      print("trying");
      final response = await http.get(uri, headers: {
        "X-RapidAPI-Key": "6003ace11emsh2f7d70cdacd9918p11f55djsnde6448aa709d",
        "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
        "useQueryString": "true"
      });

      if (response.statusCode == 200) {
        print("success");

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

        return RecipeModel.recipesFromSnapshot(_temp);
      } else {
        throw Exception("Something went wrong!, ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Something went wrong!, ${e.toString()}");
    }
  }
}