import 'dart:convert';

MyFoodModel getProductModel(String data) {
  Map<String, dynamic> map = json.decode(data);
  return MyFoodModel.fromJson(map);
}


class MyFoodModel {
  MyFoodModel({
    required this.myFood,
  });
  late final List<MyFood> myFood;

  MyFoodModel.fromJson(Map<String, dynamic> json){
    myFood = List.from(json['myFood']).map((e)=>MyFood.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['myFood'] = myFood.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MyFood {
  MyFood({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.description = "no description",
  });
  late final String id;
  late final String name;
  late final String imageUrl;
  late final String description;

  MyFood.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['imageUrl'] = imageUrl;
    _data['description'] = description;
    return _data;
  }
}