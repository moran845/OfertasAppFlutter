import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/car_item.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cart;

  const CartScreen({super.key, required this.cart});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItem> cart;

  @override
  void initState() {
    super.initState();
    cart = widget.cart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        backgroundColor: Colors.teal,
      ),
      body: cart.isEmpty
          ? const Center(
              child: Text(
                'El carrito está vacío',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        elevation: 4,
                        child: ListTile(
                          leading: Image.asset(
                            item.imageUrl,  // Usar la propiedad imageUrl
                            width: 50,
                          ),
                          title: Text(
                            item.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                '\$${item.price.toString()}',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.green),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'x${item.quantity}',  // Mostrar la cantidad
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle,
                                color: Colors.red),
                            onPressed: () {
                              // Aquí puedes añadir funcionalidad para eliminar el artículo
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _procesarPedido(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,  // Color del botón
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 30),
                    ),
                    child: const Text(
                      'Procesar Pedido',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  // Función que procesa el pedido y lo envía a la API
  void _procesarPedido(BuildContext context) async {
    // Convertir los datos del carrito en el formato que requiere la API
    final userId = 1;  // Asegúrate de obtener este valor dinámicamente si es necesario
    final total = cart.fold(0.0, (sum, item) => sum + item.totalPrice);  // Usar totalPrice de CartItem
    final estado = "Pendiente";  // O lo que corresponda según el estado del pedido
    final fecha = DateTime.now().toString().split(" ")[0];  // Fecha actual

    final items = cart.map((item) {
      return {
        "name": item.name,
        "price": item.price,
        "quantity": item.quantity,
        "image_url": item.imageUrl,
      };
    }).toList();

    final pedidoData = {
      "user_id": userId,
      "total": total,
      "estado": estado,
      "fecha": fecha,
      "items": items,
    };

    // Hacer la solicitud POST
    final url = Uri.parse('http://51.222.142.170/crearpedido');
    await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(pedidoData),
    );

    // Mostrar el mensaje de éxito de forma independiente de la respuesta
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pedido Procesado'),
          content: const Text('¡Tu pedido ha sido procesado correctamente!'),
          actions: [
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                // Limpiar el carrito
                setState(() {
                  cart.clear();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
