import 'package:get/get.dart';
import 'package:food_menu_app/models/food_model.dart';
import 'package:food_menu_app/services/api_service.dart';

class FoodSearchController extends GetxController {
  final allFoods = <Food>[].obs;
  final filteredFoods = <Food>[].obs;
  final isLoading = true.obs;
  final errorMessage = RxnString();
  final query = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadFoods();
  }

  Future<void> loadFoods() async {
    try {
      isLoading(true);

      final results = await Future.wait([
        getFoods(),
        getDrinks(),
        getSnacks(),
        getDesserts(),
      ]);

      final foods = results[0];
      final drinks = results[1];
      final snacks = results[2];
      final desserts = results[3];

      for (var item in foods) {
        item.category = 'food';
      }
      for (var item in drinks) {
        item.category = 'drink';
      }
      for (var item in snacks) {
        item.category = 'snack';
      }
      for (var item in desserts) {
        item.category = 'dessert';
      }

      allFoods.value = [...foods, ...drinks, ...snacks, ...desserts];
    } catch (e) {
      errorMessage.value = "Failed to load menu items";
    } finally {
      isLoading(false);
    }
  }

  void filterFoods(String searchQuery) {
    query.value = searchQuery;
    if (searchQuery.isEmpty) {
      filteredFoods.clear();
      return;
    }

    final lowerCaseQuery = searchQuery.toLowerCase();
    filteredFoods.value = allFoods.where((food) {
      final name = food.name?.toLowerCase() ?? '';
      return name.contains(lowerCaseQuery);
    }).toList();
  }
}
