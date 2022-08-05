import 'dart:convert';

MyFavoriteFoodModel getProductModel(String data) {
  Map<String, dynamic> map = json.decode(data);
  return MyFavoriteFoodModel.fromJson(map);
}

class MyFavoriteFoodModel {
  MyFavoriteFoodModel({
    required this.favoritefoods,
  });
  late final List<favoritefood> favoritefoods;

  MyFavoriteFoodModel.fromJson(Map<String, dynamic> json){
    favoritefoods = List.from(json['favorite_food']).map((e) => favoritefood.fromJson(e)).toList();
  }
  Map<String, dynamic> toJson(){
    final _data = <String, dynamic>{};
    _data['favorite_food'] = favoritefoods.map((e) => e.toJson()).toList();
    return _data;

  } 
}
// ignore: camel_case_types
class favoritefood{
  favoritefood({
    required this.id,
    required this.name,
    required this.image,
    this.description = "no description",
  });
  late final String id;
  late final String name;
  late final String image;
  late final String description;
  
  favoritefood.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json ['image'];
    description = json['description'];
  }
  Map<String,dynamic> toJson(){
    final _data = <String , dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['description'] = description;
    return _data;
  }
}
