
import 'package:flutter/material.dart';
import 'package:food_menu_app/constants.dart';
import 'package:food_menu_app/controllers/search_controller.dart' as app;
import 'package:food_menu_app/widgets/product_card_widget.dart';
import 'package:get/get.dart';

class SearchScreen extends GetView<app.SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Search by name",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey.shade500),
          ),
          onChanged: controller.filterFoods,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.errorMessage.value != null) {
            return Center(child: Text(controller.errorMessage.value!));
          }
          if (controller.filteredFoods.isEmpty) {
            return Center(
              child: Text(
                controller.query.value.isEmpty
                    ? "Type to search"
                    : "No items found",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: controller.filteredFoods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return ProductCard(item: controller.filteredFoods[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
