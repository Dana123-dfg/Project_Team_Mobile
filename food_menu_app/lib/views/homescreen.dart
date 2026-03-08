import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_menu_app/controllers/home_controller.dart';
import 'package:food_menu_app/controllers/auth_controller.dart';
import 'package:food_menu_app/models/items_model.dart';
import 'package:food_menu_app/main.dart';
import 'package:food_menu_app/views/card_screen.dart';
import 'package:food_menu_app/views/login_screen.dart';
import 'package:food_menu_app/views/search_screen.dart';
import 'package:food_menu_app/widgets/cart_badge.dart';
import 'package:food_menu_app/widgets/categories_widget.dart';
import 'package:food_menu_app/widgets/popluar_widget.dart';
import 'package:food_menu_app/widgets/product_card_widget.dart';
import 'package:food_menu_app/widgets/search_widget.dart';
import 'package:get/get.dart';

class Homescreen extends GetView<HomeController> {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: SearchWidget(
                        onTap: () {
                          Get.to(() => SearchScreen());
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.to(() => CardScreen());
                        },
                        icon: const CartBadge(
                          child: Icon(Icons.shopping_bag_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        tooltip: 'Logout',
                        onPressed: () async {
                          await Get.find<AuthController>().logout();
                          Get.offAll(() => const MainBackgroundWrapper(child: LoginScreen()));
                        },
                        icon: const Icon(Icons.logout),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Obx(
                  () => CarouselSlider(
                    options: CarouselOptions(
                      height: 150,

                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 800,
                      ),
                      enlargeCenterPage: true,
                      // viewportFraction: 1,
                      onPageChanged: (index, _) {
                        controller.changeBanner(index);
                      },
                    ),
                    items: controller.bannerImg.map((path) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(path, fit: BoxFit.cover),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.35),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),

                              const Positioned(
                                left: 16,
                                bottom: 16,
                                child: Text(
                                  "Khmer Angkor\nRestaurant",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 10),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.bannerImg.asMap().entries.map((entry) {
                      return Container(
                        width: controller.currentIndex == entry.key ? 16 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: controller.currentIndex == entry.key
                              ? Colors.green
                              : Colors.grey.shade300,
                        ),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  "Category",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: categories
                        .map((cat) => CategoryItem(category: cat))
                        .toList(),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Obx(
                  () => controller.isLoadingPopular.value
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 135,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.popularFoods.length,
                            itemBuilder: (_, i) => PopularItemCard(
                              item: controller.popularFoods[i],
                            ),
                          ),
                        ),
                ),

                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All Menu',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Obx(
                  () => controller.isLoadingAll.value
                      ? CircularProgressIndicator()
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // itemCount: foods.length,
                          itemCount: 16,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                          itemBuilder: (context, index) {
                            return ProductCard(
                              item: controller.allFoods[index],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
