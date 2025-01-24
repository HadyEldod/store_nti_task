import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/cubit/cubit/cart_cubit.dart';
import '../../fav/cubit/favourite_cubit.dart';
import '../cubit/lap_top_cubit.dart';
import '../cubit/lap_top_state.dart';

class LaptopScreen extends StatelessWidget {
  const LaptopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LaptopCubit()..getLaptop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Laptops",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: BlocBuilder<LaptopCubit, LaptopState>(
          builder: (context, state) {
            if (state is LaptopLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LaptopSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: state.laptopList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final laptop = state.laptopList[index];

                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  laptop.image,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              laptop.description,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "\$${laptop.price}",
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    CartCubit.get(context).getAddToCartCubit();
                                  },
                                  icon: const Icon(Icons.add_shopping_cart_sharp)),
                              IconButton(
                                  onPressed: () {
                                    FavouriteCubit.get(context).addFavCubit(
                                        productId: state.laptopList[index].id);
                                  },
                                  icon: const Icon(Icons.favorite))
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(child: Text("Fetching laptops..."));
          },
        ),
      ),
    );
  }
}