import 'dart:convert';

PandaPickModel getPandaPickModel(String data) {
  Map<String, dynamic> map = json.decode(data);
  return PandaPickModel.fromJson(map);
}

class PandaPickModel {
  PandaPickModel({
    required this.pandaPick,
  });
  late final List<PandaPick> pandaPick;

  PandaPickModel.fromJson(Map<String, dynamic> json){
    pandaPick = List.from(json['pandaPick']).map((e)=>PandaPick.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pandaPick'] = pandaPick.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PandaPick {
  PandaPick({
    required this.id,
    required this.name,
    required this.totalTime,
    required this.image,
    required this.description,
    required this.rating,
    required this.deliveryPrice,
  });
  late final String id;
  late final String name;
  late final String totalTime;
  late final String image;
  late final String description;
  late final String rating;
  late final String deliveryPrice;

  PandaPick.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    totalTime = json['totalTime'];
    image = json['image'];
    description = json['description'];
    rating = json['rating'];
    deliveryPrice = json['deliveryPrice'];
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
    return _data;
  }
}