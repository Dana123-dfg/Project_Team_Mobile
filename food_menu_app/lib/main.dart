import 'package:flutter/material.dart';
import 'package:food_menu_app/binding/app_binding.dart';
import 'package:food_menu_app/constants.dart';
import 'package:food_menu_app/controllers/auth_controller.dart';
import 'package:food_menu_app/views/homescreen.dart';
import 'package:food_menu_app/views/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AuthController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
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
      home: Obx(
        () => MainBackgroundWrapper(
          child: auth.isLoggedIn.value ? const Homescreen() : const LoginScreen(),
        ),
      ),
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
            AppColors.primaryOrange,
            Color.fromARGB(255, 255, 250, 241),
          ],
          stops: [0.0, 0.4], 
        ),
      ),
      child: child,
    );
  }
}
