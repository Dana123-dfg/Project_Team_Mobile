import 'package:flutter/material.dart';
import 'package:food_menu_app/controllers/category_controller.dart';
import 'package:food_menu_app/widgets/drink_card_widget.dart';
import 'package:get/get.dart';

class DrinkScreen extends GetView<CategoryController> {
  const DrinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchDrinks();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Drinks",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        shape: const Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromARGB(255, 227, 227, 227),
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoadingDrinks.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.drinks.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return DrinkCardWidget(item: controller.drinks[index]);
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
