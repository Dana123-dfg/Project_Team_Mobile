import 'package:flutter/material.dart';

import 'package:food_menu_app/controllers/cart_controller.dart';
import 'package:food_menu_app/models/food_model.dart';
import 'package:food_menu_app/views/card_screen.dart';
import 'package:food_menu_app/views/order_detail_screen.dart';
import 'package:food_menu_app/widgets/cart_badge.dart';
import 'package:get/get.dart';

class DrinkDetailScreen extends GetView<CartController> {
  final Food drinkItem;

  DrinkDetailScreen({super.key, required this.drinkItem});

  final RxInt quantity = 1.obs;

  static const Color primaryOrange = Color(0xFFFF6B00);
  static const Color peachBackground = Color(0xFFFDB87D);
  static const Color darkText = Color(0xFF0F1E3D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: Get.back,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => CardScreen()),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const CartBadge(
                        child: Icon(Icons.shopping_bag_outlined, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      drinkItem.name?.isNotEmpty == true
                          ? drinkItem.name!
                          : "No Name",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$${drinkItem.price}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// Image
                    SizedBox(
                      height: 350,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 320,
                            height: 320,
                            decoration: const BoxDecoration(
                              color: peachBackground,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            height: 230,
                            width: 170,
                            child: Image.network(
                              drinkItem.image?.isNotEmpty == true
                                  ? drinkItem.image!
                                  : 'https://via.placeholder.com/300',
                              fit: BoxFit.fitHeight,
                              errorBuilder: (_, _, _) =>
                                  const Icon(Icons.image_not_supported),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Quantity Selector
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _qtyButton(Icons.remove_outlined, () {
                            if (quantity.value > 1) {
                              quantity.value--;
                            }
                          }),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              quantity.value.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _qtyButton(Icons.add, () => quantity.value++),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Bottom Bar
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade100)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${drinkItem.price}\$",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      // Add to Cart Button
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.addToCart(
                                drinkItem,
                                quantity: quantity.value,
                              );
                              Get.snackbar(
                                "Success",
                                "Added to cart",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 1),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryOrange,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Order Now Button
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.addToCart(
                                drinkItem,
                                quantity: quantity.value,
                              );
                              Get.to(
                                () =>
                                    OrderDetailScreen(items: controller.items),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryOrange,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Order Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          color: primaryOrange,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
