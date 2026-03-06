import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_menu_app/controllers/cart_controller.dart';
import 'package:food_menu_app/models/food_model.dart';
import 'package:food_menu_app/views/detail_screen.dart';

import 'package:food_menu_app/views/drink_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Food item;

  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          if (item.category == 'drink') {
            Get.to(
              () => DrinkDetailScreen(drinkItem: item),
              preventDuplicates: false,
            );
          } else {
            Get.to(() => DetailScreen(item: item), preventDuplicates: false);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 IMAGE (NETWORK)
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item.image != null && item.image!.isNotEmpty
                        ? item.image!
                        : 'https://via.placeholder.com/300',
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) =>
                        const Icon(Icons.image_not_supported),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // 🔹 NAME
              Text(
                item.name?.isNotEmpty == true ? item.name! : "No Name",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 6),

              // 🔹 DESCRIPTION
              Text(
                item.description?.isNotEmpty == true
                    ? item.description!
                    : "No description",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),

              const Spacer(),

              // 🔹 PRICE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${item.price ?? '0'} \$",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      CartController.instance.addToCart(item);
                      Get.snackbar(
                        "Cart",
                        "Added ${item.name} to cart",
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 1),
                        backgroundColor: Colors.white,
                      );
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFF6B00),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
