import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  String selectedCategory = 'Selecciona una categoría';
  String selectedGender = 'Todos';

  final List<String> categories = [
    'Selecciona una categoría',
    'Calzado Casual',
    'Calzado Deportivo',
    'Ropa Casual',
    'Ropa Deportiva',
    'Accesorios'
  ];

  final List<String> genders = ['Todos', 'Hombre', 'Mujer', 'Niños'];

  // Productos por categoría y cliente con 10 ejemplos
  final Map<String, Map<String, List<Map<String, String>>>> items = {
    'Calzado Casual': {
      'Hombre': [
        {'name': 'Zapato Casual Hombre 1', 'price': 'Desde: \$59.99', 'image': 'assets/shoes_men_1.jpg'},
        {'name': 'Zapato Casual Hombre 2', 'price': 'Desde: \$69.99', 'image': 'assets/shoes_men_2.jpg'},
        {'name': 'Zapato Casual Hombre 3', 'price': 'Desde: \$79.99', 'image': 'assets/shoes_men_3.jpg'},
        {'name': 'Zapato Casual Hombre 4', 'price': 'Desde: \$89.99', 'image': 'assets/shoes_men_4.jpg'},
        {'name': 'Zapato Casual Hombre 5', 'price': 'Desde: \$99.99', 'image': 'assets/shoes_men_5.jpg'},
        {'name': 'Zapato Casual Hombre 6', 'price': 'Desde: \$49.99', 'image': 'assets/shoes_men_6.jpg'},
        {'name': 'Zapato Casual Hombre 7', 'price': 'Desde: \$59.99', 'image': 'assets/shoes_men_7.jpg'},
        {'name': 'Zapato Casual Hombre 8', 'price': 'Desde: \$69.99', 'image': 'assets/shoes_men_8.jpg'},
        {'name': 'Zapato Casual Hombre 9', 'price': 'Desde: \$79.99', 'image': 'assets/shoes_men_9.jpg'},
        {'name': 'Zapato Casual Hombre 10', 'price': 'Desde: \$89.99', 'image': 'assets/shoes_men_10.jpg'},
      ],
      'Mujer': [
        {'name': 'Zapato Casual Mujer 1', 'price': 'Desde: \$49.99', 'image': 'assets/shoes_women_1.jpg'},
        {'name': 'Zapato Casual Mujer 2', 'price': 'Desde: \$59.99', 'image': 'assets/shoes_women_2.jpg'},
        {'name': 'Zapato Casual Mujer 3', 'price': 'Desde: \$69.99', 'image': 'assets/shoes_women_3.jpg'},
        {'name': 'Zapato Casual Mujer 4', 'price': 'Desde: \$79.99', 'image': 'assets/shoes_women_4.jpg'},
        {'name': 'Zapato Casual Mujer 5', 'price': 'Desde: \$89.99', 'image': 'assets/shoes_women_5.jpg'},
        {'name': 'Zapato Casual Mujer 6', 'price': 'Desde: \$99.99', 'image': 'assets/shoes_women_6.jpg'},
        {'name': 'Zapato Casual Mujer 7', 'price': 'Desde: \$49.99', 'image': 'assets/shoes_women_7.jpg'},
        {'name': 'Zapato Casual Mujer 8', 'price': 'Desde: \$59.99', 'image': 'assets/shoes_women_8.jpg'},
        {'name': 'Zapato Casual Mujer 9', 'price': 'Desde: \$69.99', 'image': 'assets/shoes_women_9.jpg'},
        {'name': 'Zapato Casual Mujer 10', 'price': 'Desde: \$79.99', 'image': 'assets/shoes_women_10.jpg'},
      ],
      'Niños': [
        {'name': 'Zapato Casual Niños 1', 'price': 'Desde: \$39.99', 'image': 'assets/shoes_kids_1.jpg'},
        {'name': 'Zapato Casual Niños 2', 'price': 'Desde: \$29.99', 'image': 'assets/shoes_kids_2.jpg'},
        {'name': 'Zapato Casual Niños 3', 'price': 'Desde: \$49.99', 'image': 'assets/shoes_kids_3.jpg'},
        {'name': 'Zapato Casual Niños 4', 'price': 'Desde: \$39.99', 'image': 'assets/shoes_kids_4.jpg'},
        {'name': 'Zapato Casual Niños 5', 'price': 'Desde: \$29.99', 'image': 'assets/shoes_kids_5.jpg'},
        {'name': 'Zapato Casual Niños 6', 'price': 'Desde: \$39.99', 'image': 'assets/shoes_kids_6.jpg'},
        {'name': 'Zapato Casual Niños 7', 'price': 'Desde: \$49.99', 'image': 'assets/shoes_kids_7.jpg'},
        {'name': 'Zapato Casual Niños 8', 'price': 'Desde: \$29.99', 'image': 'assets/shoes_kids_8.jpg'},
        {'name': 'Zapato Casual Niños 9', 'price': 'Desde: \$39.99', 'image': 'assets/shoes_kids_9.jpg'},
        {'name': 'Zapato Casual Niños 10', 'price': 'Desde: \$29.99', 'image': 'assets/shoes_kids_10.jpg'},
      ],
    },
    // Añadir más categorías y ejemplos aquí...
    'Calzado Deportivo': {
      'Hombre': [
        {'name': 'Zapatillas Deportivas Hombre', 'price': 'Desde: \$29.99', 'image': 'assets/sport_shoes_men.jpg'},
      ],
      'Mujer': [
        {'name': 'Zapatillas Deportivas Mujer', 'price': 'Desde: \$34.99', 'image': 'assets/sport_shoes_women.jpg'},
      ],
      'Niños': [
        {'name': 'Zapatillas Deportivas Niños', 'price': 'Desde: \$19.99', 'image': 'assets/sport_shoes_kids.jpg'},
      ],
    },
    'Ropa Casual': {
      'Hombre': [
        {'name': 'Camiseta Casual Hombre', 'price': 'Desde: \$14.99', 'image': 'assets/tshirt_men.jpg'},
      ],
      'Mujer': [
        {'name': 'Vestido Casual Mujer', 'price': 'Desde: \$34.99', 'image': 'assets/dress_women.jpg'},
      ],
      'Niños': [
        {'name': 'Camisa Casual Niños', 'price': 'Desde: \$24.99', 'image': 'assets/tshirt_kids.jpg'},
      ],
    },
    'Ropa Deportiva': {
      'Hombre': [
        {'name': 'Pantalones Deportivos Hombre', 'price': 'Desde: \$24.99', 'image': 'assets/sport_pants_men.jpg'},
      ],
      'Mujer': [
        {'name': 'Pantalones Deportivos Mujer', 'price': 'Desde: \$22.99', 'image': 'assets/sport_pants_women.jpg'},
      ],
      'Niños': [
        {'name': 'Pantalones Deportivos Niños', 'price': 'Desde: \$19.99', 'image': 'assets/sport_pants_kids.jpg'},
      ],
    },
    'Accesorios': {
      'Hombre': [
        {'name': 'Reloj de Pulsera Hombre', 'price': 'Desde: \$59.99', 'image': 'assets/watch_men.jpg'},
      ],
      'Mujer': [
        {'name': 'Cartera Elegante Mujer', 'price': 'Desde: \$35.00', 'image': 'assets/bag_women.jpg'},
      ],
      'Niños': [
        {'name': 'Reloj Niños', 'price': 'Desde: \$29.99', 'image': 'assets/watch_kids.jpg'},
      ],
    },
  };

  // Función que filtra productos según la categoría y cliente
  List getFilteredItems() {
    if (selectedCategory == 'Selecciona una categoría' && selectedGender == 'Todos') {
      // Mostrar todos los productos si no hay categoría ni tipo de cliente seleccionado
      return items.values.expand((categoryMap) {
        return categoryMap.values.expand((productList) {
          return productList;
        }).toList();
      }).toList();
    } else if (selectedCategory != 'Selecciona una categoría' && selectedGender != 'Todos') {
      // Mostrar productos según categoría y tipo de cliente
      final categoryItems = items[selectedCategory];
      if (categoryItems != null) {
        return categoryItems[selectedGender] ?? [];
      }
    } else if (selectedCategory != 'Selecciona una categoría') {
      // Mostrar todos los productos de la categoría seleccionada si no se ha seleccionado un tipo de cliente
      return items[selectedCategory]!.values.expand((productList) => productList).toList();
    } else if (selectedGender != 'Todos') {
      // Mostrar todos los productos del tipo de cliente seleccionado si no se ha seleccionado una categoría
      return items.values.expand((categoryMap) {
        return categoryMap[selectedGender] ?? [];
      }).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ofertas'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Funcionalidad del carrito de compras
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Selecciona tipo de cliente',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ...genders.map((gender) {
              return ListTile(
                title: Text(gender),
                onTap: () {
                  setState(() {
                    selectedGender = gender;
                  });
                  Navigator.pop(context); // Cerrar el menú
                },
              );
            }).toList(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Menú desplegable para categorías
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: DropdownButton<String>(
                value: selectedCategory,
                onChanged: (newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: categories.map<DropdownMenuItem<String>>((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
              ),
            ),
            // Grid de productos
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300, // El ancho máximo que puede tener cada elemento
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: getFilteredItems().length,
                itemBuilder: (context, index) {
                  final item = getFilteredItems()[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                            child: Image.asset(
                              item['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['name']!,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item['price']!,
                            style: const TextStyle(fontSize: 14, color: Colors.pinkAccent),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).splashColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              // Funcionalidad para agregar al carrito
                            },
                            child: const Text('Añadir al carrito'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
