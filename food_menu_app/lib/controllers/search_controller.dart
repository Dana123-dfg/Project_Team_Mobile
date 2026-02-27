import 'package:get/get.dart';
import 'package:food_menu_app/models/food_model.dart';
import 'package:food_menu_app/services/api_service.dart';

class SearchController extends GetxController {
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
      allFoods.value = await getAllMenu();
    } catch (e) {
      errorMessage.value = "Failed to load foods";
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
