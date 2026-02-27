import 'package:flutter/material.dart';
import 'package:food_menu_app/constants.dart';
import 'package:food_menu_app/controllers/detail_controller.dart';
import 'package:food_menu_app/models/food_model.dart';
import 'package:food_menu_app/views/card_screen.dart';
import 'package:food_menu_app/widgets/cart_badge.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class DetailScreen extends StatelessWidget {
  final Food item;
  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Use a unique tag for each item to avoid reusing the same controller instance
    final controllerTag = item.id?.toString() ?? item.name ?? 'unknown';
    final controller = Get.put(DetailController(item), tag: controllerTag);

      final Color primaryOrange = Color(0xFFFF6B00);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.45,
              width: double.infinity,
              child: Image.network(
                item.image != null && item.image!.isNotEmpty
                    ? item.image!
                    : 'https://via.placeholder.com/300',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button (White Arrow)
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                // Cart Button (White rounded bg, Black Icon)
                GestureDetector(
                  onTap: () {
                    Get.to(() => CardScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const CartBadge(
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.40,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title and Quantity Row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Text(
                                  item.name?.isNotEmpty == true
                                      ? item.name!
                                      : "No Name",
                                  style: AppTextStyles.headline.copyWith(
                                    color: Colors.black,
                                    fontSize: 22, // Adjusted for aesthetics
                                    height: 1.2,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),

                              // Quantity Controls
                              Obx(
                                () => Flexible(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _buildQuantityButton(
                                        icon: Icons.remove_outlined,
                                        color: primaryOrange,
                                        onTap: () {
                                          controller.decrease();
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Text(
                                          controller.quantity.value.toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      _buildQuantityButton(
                                        icon: Icons.add,
                                        color: primaryOrange,
                                        onTap: () {
                                          controller.increase();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // Timer / Duration
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: Colors.grey,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                item.duration ?? "No Duration",
                                style: AppTextStyles.foodDescription.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          // About Section
                          Text(
                            "About",
                            style: AppTextStyles.sectionTitle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.description?.isNotEmpty == true
                                ? item.description!
                                : "No Description",
                            style: AppTextStyles.foodDescription.copyWith(
                              fontSize: 13,
                              height: 1.6, // Better readability
                              color: Colors.grey[600],
                            ),
                          ),

                          // Space for Bottom Bar
                          const SizedBox(height: 130),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Bar (Fixed)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, -5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item.price} \$",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F1E3D), // Dark blue/black shade
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
                              controller.addToCart();
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
                              controller.orderNow();
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
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24, // Fixed size for circles
        height: 24,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
