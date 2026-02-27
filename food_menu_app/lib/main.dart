import 'package:flutter/material.dart';
import 'package:food_menu_app/binding/app_binding.dart';
import 'package:food_menu_app/constants.dart';
import 'package:food_menu_app/views/homescreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'M3 Restaurant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryOrange),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialBinding: AppBinding(),
      home: MainBackgroundWrapper(child: Homescreen()),
    );
  }
}

class MainBackgroundWrapper extends StatelessWidget {
  final Widget child;
  const MainBackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryOrange, // Top orange
            // Color(0XFFFF9A52),
            // AppColors.background, // Bottom peach/white
            Color.fromARGB(255, 255, 250, 241),
          ],
          stops: [0.0, 0.4], // Adjust gradient stop to match image
        ),
      ),
      child: child,
    );
  }
}
