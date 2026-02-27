import 'package:get/get.dart';
import 'package:food_menu_app/models/cart_item.dart';
import 'package:food_menu_app/models/food_model.dart';

class CartController extends GetxController {
  // We'll keep the static instance for easy access if needed, 
  // but we should ideally use Get.find<CartController>()
  static CartController get instance => Get.find<CartController>();

  final RxList<CartItem> _cartItems = <CartItem>[].obs;

  List<CartItem> get items => _cartItems;

  void addToCart(Food food, {int quantity = 1}) {
    // Check if item already exists
    int index = _cartItems.indexWhere((item) {
      // 1. If both have IDs, check if IDs match
      if (item.food.id != null && food.id != null) {
        if (item.food.id != food.id) return false;
        return item.food.name == food.name;
      }
      // 2. If one or both lack IDs, fallback to Name + Price match
      return item.food.name == food.name && item.food.price == food.price;
    });

    if (index != -1) {
      _cartItems[index].quantity += quantity;
      _cartItems.refresh(); // Notify listeners of internal quantity change
    } else {
      _cartItems.add(CartItem(food: food, quantity: quantity));
    }
  }

  void removeCartItem(CartItem item) {
    _cartItems.remove(item);
  }

  void clearCart() {
    _cartItems.clear();
  }

  void incrementQuantity(CartItem item) {
    item.quantity++;
    _cartItems.refresh();
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _cartItems.remove(item);
    }
    _cartItems.refresh();
  }

  double get totalPrice {
    return _cartItems.fold(0, (total, item) {
      double price = 0;
      if (item.food.price != null) {
        String priceStr = item.food.price!.replaceAll(RegExp(r'[^0-9.]'), '');
        price = double.tryParse(priceStr) ?? 0;
      }
      return total + (price * item.quantity);
    });
  }

  int get totalQuantity {
    return _cartItems.fold(0, (total, item) => total + item.quantity);
  }
}
