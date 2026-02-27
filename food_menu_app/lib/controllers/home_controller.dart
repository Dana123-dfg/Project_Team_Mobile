import 'package:get/get.dart';
import 'package:food_menu_app/models/food_model.dart';
import 'package:food_menu_app/services/api_service.dart';

class HomeController extends GetxController {
  // Banner
  final bannerImg = <String>[
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/ca/5d/27/wwwchangkrankhmercom.jpg?w=900&h=500&s=1",
    "https://www.amazon-angkor.com/userfiles/mobile/amazon-angkor-restaurant-mobile.jpg",
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/bc/21/19/damnak-mahob-khmer-restaurant.jpg?w=900&h=500&s=1",
  ].obs;

  final currentIndex = 0.obs;

  // Data
  final popularFoods = <Food>[].obs;
  final allFoods = <Food>[].obs;

  final isLoadingPopular = true.obs;
  final isLoadingAll = true.obs;

  @override
  void onInit() {
    fetchPopularFoods();
    fetchAllFoods();
    super.onInit();
  }

  void fetchPopularFoods() async {
    try {
      isLoadingPopular(true);
      popularFoods.value = await getPopularFoods();
    } catch (e) {
      Get.snackbar("Error", "Failed to load popular foods");
    } finally {
      isLoadingPopular(false);
    }
  }

  void fetchAllFoods() async {
    try {
      isLoadingAll(true);
      allFoods.value = await getAllMenu();
    } catch (e) {
      Get.snackbar("Error", "Failed to load menu");
    } finally {
      isLoadingAll(false);
    }
  }

  void changeBanner(int index) {
    currentIndex.value = index;
  }
}
