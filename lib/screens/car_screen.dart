import 'package:flutter/material.dart';
import '../models/car_item.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cart;

  const CartScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: cart.isEmpty
          ? const Center(child: Text('El carrito está vacío'))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toString()}'),
                );
              },
            ),
    );
  }
}