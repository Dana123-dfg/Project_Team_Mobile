import 'dart:convert';
import 'package:food_menu_app/models/food_model.dart';
import 'package:http/http.dart' as http;


Future<List<Food>> getPopularFoods() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/popularfoods'));

  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<Food> foods = body.map((dynamic item) => Food.fromJson(item)).toList();
    
    return foods;
  } else {
    throw "Failed to load food list";
  }
}

Future<List<Food>> getAllMenu() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/_all_foods'));

  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);

    List<Food> foods = body.map((dynamic item) => Food.fromJson(item)).toList();
    
    return foods;
  } else {
    throw "Failed to load food list";
  }
}

Future<List<Food>> getFoods() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/foods'));

  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<Food> foods = body.map((dynamic item) => Food.fromJson(item)).toList();
    
    return foods;
  } else {
    throw "Failed to load food list";
  }
}

Future<List<Food>> getDrinks() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/drinks'));

  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<Food> foods = body.map((dynamic item) => Food.fromJson(item)).toList();
    
    return foods;
  } else {
    throw "Failed to load food list";
  }
}

Future<List<Food>> getSnacks() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/snacks'));

  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<Food> foods = body.map((dynamic item) => Food.fromJson(item)).toList();
    
    return foods;
  } else {
    throw "Failed to load food list";
  }
}

Future<List<Food>> getDesserts() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/desserts'));

  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<Food> foods = body.map((dynamic item) => Food.fromJson(item)).toList();
    
    return foods;
  } else {
    throw "Failed to load food list";
  }
}