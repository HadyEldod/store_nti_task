import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit/cart_cubit.dart';
import '../cubit/cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getAllCartCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
          if (state is CartGetAllSuccess) {
            return ListView.builder(
              itemCount: state.listCart.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(state.listCart[index].image),
                    ),
                    title: Text(
                      state.listCart[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'KWD ${state.listCart[index].price.toString()}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        CartCubit.get(context).deleteCartCubit(
                            productId: state.listCart[index].id);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}