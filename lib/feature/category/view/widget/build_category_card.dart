import 'package:flutter/material.dart';

import '../../../Laptop/view/laptop_screen.dart';
import 'category_card.dart';
import 'category_list.dart';

class CategoryCardBuilder extends StatelessWidget {
  const CategoryCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(categoryList(context).length, (index) {
              return GestureDetector(
                onTap: categoryList(context)[index].onTap,
                child: Card(
                  color: Colors.teal[300],
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    child: Center(
                      child: Text(
                        categoryList(context)[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LaptopScreen(),
                  ),
                );
              },
              child: Card(
                color: Colors.teal[300],
                elevation: 5.0,
                margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: Center(
                    child: Text(
                      'Laptops',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
