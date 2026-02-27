import 'package:flutter/material.dart';
import 'package:food_menu_app/constants.dart';
import 'package:food_menu_app/models/items_model.dart';
import 'package:food_menu_app/views/dessert_screen.dart';
import 'package:food_menu_app/views/drink_screen.dart';
import 'package:food_menu_app/views/food_screen.dart';
import 'package:food_menu_app/views/snack_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});
  static final Map<String, Widget> categoryRoutes = {
    'food': FoodsScreen(),
    'drink': DrinkScreen(),
    'snack': SnackScreen(),
    'dessert': DessertScreen(),
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            final screen = categoryRoutes[category.id];

            if (screen == null) {
              debugPrint('No route found for category: ${category.id}');
              return;
            }

            Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
          },

          // onTap: () {
          //   switch (category.id) {
          //     case '1': // Foods
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (_) => const FoodsScreen()),
          //       );
          //       break;

          //     case '2': // Drinks
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (_) => const DrinkScreen()),
          //       );
          //       break;

          //     case '3': // Snacks
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (_) => const SnackScreen()),
          //       );
          //       break;

          //     case '4': // Dessert
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (_) => const DessertScreen()),
          //       );
          //       break;
          //   }
          // },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(14),
              // color: Colors.white,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.05),
              //     blurRadius: 10,
              //     offset: const Offset(0, 5),
              //   ),
              // ],
            ),
            // Use ClipOval or child: Image for better control over padding
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                category.imagePath, // Use the property from your Category model
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(category.name, style: AppTextStyles.categoryLabel),
      ],
    );
  }
}
