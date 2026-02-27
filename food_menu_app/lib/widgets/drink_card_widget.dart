import 'package:flutter/material.dart';
import 'package:food_menu_app/controllers/cart_controller.dart';
import 'package:food_menu_app/models/food_model.dart';
import 'package:food_menu_app/models/items_model.dart';
import 'package:food_menu_app/views/detail_screen.dart';
import 'package:food_menu_app/views/drink_detail_screen.dart';

class DrinkCardWidget extends StatelessWidget {
  final Food item;

  const DrinkCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,

      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DrinkDetailScreen(  drinkItem: item,)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
            //      boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.05),
            //     blurRadius: 10,
            //     offset: const Offset(0, 4),
            //   ),
            // ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Product Image
              Container(
                padding: EdgeInsets.all(10),
                height: 130,
                width: double.infinity,

                child: Image.network(
                    item.image != null && item.image!.isNotEmpty
                        ? item.image!
                        : 'https://via.placeholder.com/300',
                    fit: BoxFit.fitHeight,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.image_not_supported),
                  ),
              ),

              const SizedBox(height: 12),

              // 🔹 Product Title
              Text(
              item.name?.isNotEmpty == true ? item.name! : "No Name",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 6),

              // 🔹 Product Description
              Text(
                item.description?.isNotEmpty == true ? item.description! : "No description",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),

              const Spacer(),

              // 🔹 Price + Add Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${item.price} KHR",

                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      CartController.instance.addToCart(item);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Added ${item.name} to cart"),
                          duration: const Duration(seconds: 1),
                        ),
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}
