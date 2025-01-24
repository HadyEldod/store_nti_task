import 'package:flutter/material.dart';

import '../../model/category_card_model.dart';
import '../screen/category_screen.dart';

List<CategoryCardModel> categoryList(BuildContext context) {
  return [
    CategoryCardModel(
      icon: Icons.electric_bolt_sharp,
      title: 'Electronics',
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CategoryScreen(
              endPoint: 'electronics',
              title: 'Electronics',
            ),
          ),
        );
      },
    ),
    CategoryCardModel(
      icon: Icons.api_rounded,
      title: 'Jewelry',
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CategoryScreen(
              endPoint: "jewelery",
              title: 'Jewelry',
            ),
          ),
        );
      },
    ),
    CategoryCardModel(
      icon: Icons.man,
      title: 'Men Clothes',
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CategoryScreen(
              endPoint: "men's%20clothing",
              title: 'Men Clothes',
            ),
          ),
        );
      },
    ),
    CategoryCardModel(
      icon: Icons.woman,
      title: 'Women Clothes',
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CategoryScreen(
              endPoint: "women's%20clothing",
              title: 'Women Clothes',
            ),
          ),
        );
      },
    ),
  ];
}