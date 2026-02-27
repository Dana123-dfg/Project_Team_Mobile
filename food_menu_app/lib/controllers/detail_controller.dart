import 'package:get/get.dart';
import 'package:food_menu_app/models/cart_item.dart';

import 'package:food_menu_app/models/food_model.dart';
import 'package:food_menu_app/controllers/cart_controller.dart';
import 'package:food_menu_app/views/order_detail_screen.dart';

class DetailController extends GetxController {
  final Food item;

  DetailController(this.item);

  final quantity = 1.obs;

  void increase() {
    quantity.value++;
  }

  void decrease() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void addToCart({bool showSnackbar = true}) {
    CartController.instance.addToCart(
      item,
      quantity: quantity.value,
    );
    if (showSnackbar) {
      Get.snackbar(
        "Success",
        "Added to cart",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    }
  }

  void orderNow() {
    addToCart(showSnackbar: false);
    Get.to(() => OrderDetailScreen(items: CartController.instance.items));
  }
}
