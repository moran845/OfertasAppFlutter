import 'package:flutter/material.dart';


class Producto {
  final String nombre;
  final String imagen;
  final String precio;

  Producto({required this.nombre, required this.imagen, required this.precio});
}


class PantallaCarrito extends StatefulWidget {
  final List<Producto> productosEnCarrito;

  const PantallaCarrito({Key? key, required this.productosEnCarrito}) : super(key: key);

  @override
  _PantallaCarritoState createState() => _PantallaCarritoState();
}

class _PantallaCarritoState extends State<PantallaCarrito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
      ),
      body: widget.productosEnCarrito.isEmpty
          ? Center(child: Text('El carrito está vacío.'))
          : ListView.builder(
              itemCount: widget.productosEnCarrito.length,
              itemBuilder: (context, index) {
                final producto = widget.productosEnCarrito[index];
                return ListTile(
                  leading: Image.asset(producto.imagen, width: 50),
                  title: Text(producto.nombre),
                  subtitle: Text(producto.precio),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      setState(() {
                        widget.productosEnCarrito.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          mostrarDialogoCompra();
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

  void mostrarDialogoCompra() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Compra Realizada'),
          content: const Text('¡Gracias por tu compra!'),
          actions: [
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


class PantallaOfertas extends StatefulWidget {
  @override
  _PantallaOfertasState createState() => _PantallaOfertasState();
}

class _PantallaOfertasState extends State<PantallaOfertas> {
  final List<Producto> productos = [
    Producto(nombre: 'Producto 1', imagen: 'assets/producto1.png', precio: '\$10'),
    Producto(nombre: 'Producto 2', imagen: 'assets/producto2.png', precio: '\$20'),

  ];

  List<Producto> carrito = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ofertas'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: productos.length,
        itemBuilder: (BuildContext context, int index) {
          final item = productos[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  item.imagen,
                  fit: BoxFit.cover,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.nombre,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.precio,
                    style: const TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Agregar el producto al carrito
                      setState(() {
                        carrito.add(item);
                      });
                    },
                    child: const Text('Añadir al Carrito'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PantallaCarrito(productosEnCarrito: carrito),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PantallaOfertas(),
  ));
}
