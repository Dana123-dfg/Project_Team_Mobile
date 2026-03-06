import 'package:get/get.dart';
import 'package:food_menu_app/models/food_model.dart';
import 'package:food_menu_app/services/api_service.dart';

class CategoryController extends GetxController {
  final foods = <Food>[].obs;
  final drinks = <Food>[].obs;
  final snacks = <Food>[].obs;
  final desserts = <Food>[].obs;

  final isLoadingFoods = false.obs;
  final isLoadingDrinks = false.obs;
  final isLoadingSnacks = false.obs;
  final isLoadingDesserts = false.obs;

  Future<void> fetchFoods() async {
    try {
      isLoadingFoods(true);
      foods.value = await getFoods();
    } catch (e) {
      Get.snackbar("Error", "Failed to load foods");
    } finally {
      isLoadingFoods(false);
    }
  }

  Future<void> fetchDrinks() async {
    try {
      isLoadingDrinks(true);
      drinks.value = await getDrinks();
    } catch (e) {
      Get.snackbar("Error", "Failed to load drinks");
    } finally {
      isLoadingDrinks(false);
    }
  }

  Future<void> fetchSnacks() async {
    try {
      isLoadingSnacks(true);
      snacks.value = await getSnacks();
    } catch (e) {
      Get.snackbar("Error", "Failed to load snacks");
    } finally {
      isLoadingSnacks(false);
    }
  }

  Future<void> fetchDesserts() async {
    try {
      isLoadingDesserts(true);
      desserts.value = await getDesserts();
    } catch (e) {
      Get.snackbar("Error", "Failed to load desserts");
    } finally {
      isLoadingDesserts(false);
    }
  }
}
