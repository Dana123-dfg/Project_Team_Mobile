import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_menu_app/constants.dart';
import 'package:food_menu_app/models/food_model.dart';
import 'package:food_menu_app/views/detail_screen.dart';

class PopularItemCard extends StatelessWidget {
  final Food item;

  const PopularItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailScreen(item: item), preventDuplicates: false);
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: item.image != null && item.image!.isNotEmpty
                ? NetworkImage(item.image!)
                : const NetworkImage('https://via.placeholder.com/300'),
            fit: BoxFit.cover,
          ),
        ),

        child: Stack(
          children: [
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            // Text Content
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Text(
                item.name?.isNotEmpty == true ? item.name! : "No Name",
                style: AppTextStyles.cardTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
