import 'dart:convert';

FoodModel getFoodModel(String data) {
  Map<String, dynamic> map = json.decode(data);
  return FoodModel.fromJson(map);
}

class FoodModel {
  FoodModel({
    required this.food,
  });
  late final List<Food> food;

  FoodModel.fromJson(Map<String, dynamic> json){
    food = List.from(json['food']).map((e)=>Food.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['food'] = food.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Food {
  Food({
    required this.id,
    required this.name,
    required this.totalTime,
    required this.image,
    required this.description,
    required this.rating,
    required this.deliveryPrice,
    required this.category,
  });
  late final String id;
  late final String name;
  late final String totalTime;
  late final String image;
  late final String description;
  late final String rating;
  late final String deliveryPrice;
  late final String category;

  Food.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    totalTime = json['totalTime'];
    image = json['image'];
    description = json['description'];
    rating = json['rating'];
    deliveryPrice = json['deliveryPrice'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['totalTime'] = totalTime;
    _data['image'] = image;
    _data['description'] = description;
    _data['rating'] = rating;
    _data['deliveryPrice'] = deliveryPrice;
    _data['category'] = category;
    return _data;
  }
}