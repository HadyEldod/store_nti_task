import 'package:flutter/material.dart';

class CategoryCardModel {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  CategoryCardModel(
      {required this.icon, required this.title, required this.onTap});
}
