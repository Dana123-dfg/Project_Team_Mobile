// lib/screens/auth_screen.dart
import 'package:flutter/material.dart';
import 'package:food_menu_app/views/login_screen.dart';
import 'package:food_menu_app/views/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Login', icon: Icon(Icons.login)),
            Tab(text: 'Register', icon: Icon(Icons.app_registration)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          LoginScreen(),
          RegisterScreen(),
        ],
      ),
    );
  }
}
