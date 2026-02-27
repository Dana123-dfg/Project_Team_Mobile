import 'package:food_menu_app/models/food_model.dart';

class CartItem {
  final Food food;
  int quantity;

  CartItem({
    required this.food,
    this.quantity = 1,
  });

  double get subtotal {
    double price = 0;
    if (food.price != null) {
      String priceStr = food.price!.replaceAll(RegExp(r'[^0-9.]'), '');
      price = double.tryParse(priceStr) ?? 0;
    }
    return price * quantity;
  }

  Map<String, dynamic> toJson() {
    return {
      'food': food.toJson(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      food: Food.fromJson(json['food']),
      quantity: json['quantity'] ?? 1,
    );
  }
}
