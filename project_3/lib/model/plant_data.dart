import 'dart:ui';

class PlantDataModel {
  PlantDataModel({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.type,
    required this.size,
    required this.description,
    required this.water,
    required this.light,
    required this.fertilizer,
    required this.rating,
  });
  late final String name;
  late final double price;
  late final String imagePath;
  late final String type;
  late final String size;
  late final String description;
  late final int water;
  late final int light;
  late final int fertilizer;
  late final double rating;
  late int quntity;

  PlantDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    imagePath = json['image_path'];
    type = json['type'];
    size = json['size'];
    description = json['description'];
    water = json['water'];
    light = json['light'];
    fertilizer = json['fertilizer'];
    rating = json['rating'];
    quntity = json['quntity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['price'] = price;
    _data['image_path'] = imagePath;
    _data['type'] = type;
    _data['size'] = size;
    _data['description'] = description;
    _data['water'] = water;
    _data['light'] = light;
    _data['fertilizer'] = fertilizer;
    _data['rating'] = rating;
    _data['quntity'] = quntity;
    return _data;
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "imagePath": imagePath,
      "type": type,
      "size": size,
      "description": description,
      "water": water,
      "light": light,
      "fertilizer": fertilizer,
      "rating": rating,
      "quntity": quntity,
    };
  }
}
