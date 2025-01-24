import 'package:flutter/material.dart';
import '../widget/app_bar.dart';
import '../widget/bottom_nav_bar.dart';
import '../widget/build_category_card.dart';
import '../widget/drewer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: categoryAppBar(title: 'Store'),
      drawer: const MyDrawer(),
      backgroundColor: Colors.white,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 40),
        child: CategoryCardBuilder(),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}