import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:project_3/data/plants_data.dart';
import 'package:project_3/model/plant_data.dart';

class AllData {
  List<PlantDataModel> plants = [];
  List<PlantDataModel> cart = [];
  List<PlantDataModel> favorite = [];
  List<PlantDataModel> saved = [];

  final storage = GetStorage();

  AllData() {
    // storage.erase();
    loudData();
    getAllPlants();
  }

  getAllPlants() async {
    if (plants.isEmpty) {
      for (var element in plantsData) {
        plants.add(PlantDataModel.fromJson(element));
      }
    }
    if (storage.hasData("plants")) {
    } else {
      List encodableList = [];
      for (var element in plants) {
        encodableList.add(element.toJson());
      }
      await storage.write("plants", jsonEncode(encodableList));
    }
  }

  addDataToCart({required PlantDataModel plant}) async {
    cart.add(plant);
    List plantModel = [];
    cart.forEach((element) {
      plantModel.add(element.toJson());
    });
    await storage.write("cart", jsonEncode(plantModel));
  }

  addToFavorite({required PlantDataModel plant}) async {
    favorite.add(plant);
    List plantModelMap = [];
    favorite.forEach((element) {
      plantModelMap.add(element.toJson());
    });
    await storage.write("favorite", jsonEncode(plantModelMap));
  }

  addToSaved({required PlantDataModel plant}) async {
    saved.add(plant);
    List plantModelMap = [];
    saved.forEach((element) {
      plantModelMap.add(element.toJson());
    });
    await storage.write("saved", jsonEncode(plantModelMap));
  }

  loudData() {
    if (storage.hasData("plants")) {
      final reedingList = jsonDecode(storage.read("plants"));
      for (var element in reedingList) {
        plants.add(PlantDataModel.fromJson(element));
      }
    }
    if (storage.hasData("cart")) {
      final reedingList1 = jsonDecode(storage.read("cart"));
      for (var element in reedingList1) {
        cart.add(PlantDataModel.fromJson(element));
      }
    }
    if (storage.hasData("favorite")) {
      final reedingList2 = jsonDecode(storage.read("favorite"));
      for (var element in reedingList2) {
        favorite.add(PlantDataModel.fromJson(element));
      }
    }
    if (storage.hasData("saved")) {
      final reedingList3 = jsonDecode(storage.read("saved"));
      for (var element in reedingList3) {
        saved.add(PlantDataModel.fromJson(element));
      }
    }
  }

  deleteCart({required PlantDataModel plant}) async {
    cart.remove(plant);
    await storage.remove("cart");
    List plantModelMap = [];
    cart.forEach((element) {
      plantModelMap.add(element.toJson());
    });
    await storage.write("cart", jsonEncode(plantModelMap));
  }

  deleteSaved({required PlantDataModel plant}) async {
    saved.remove(plant);
    await storage.remove("saved");
    List plantModelMap = [];
    saved.forEach((element) {
      plantModelMap.add(element.toJson());
    });
    await storage.write("cart", jsonEncode(plantModelMap));
  }

  deleteFavorite({required PlantDataModel plant}) async {
    favorite.remove(plant);
    await storage.remove("cart");
    List plantModelMap = [];
    favorite.forEach((element) {
      plantModelMap.add(element.toJson());
    });
    await storage.write("cart", jsonEncode(plantModelMap));
  }
}
