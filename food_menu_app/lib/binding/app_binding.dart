import 'package:get/get.dart';
import 'package:food_menu_app/controllers/cart_controller.dart';
import 'package:food_menu_app/controllers/home_controller.dart';
import 'package:food_menu_app/controllers/category_controller.dart';
import 'package:food_menu_app/controllers/search_controller.dart' as app;

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => app.SearchController( ));
  }
}
