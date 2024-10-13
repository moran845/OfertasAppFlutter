import 'package:flutter/material.dart';
import './models/car_item.dart';
import './screens/car_screen.dart'; 

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  String selectedCategory = 'Selecciona una categoría';
  String selectedGender = 'Todos';
  final List<CartItem> cart = []; 

  final List<String> categories = [
    'Selecciona una categoría',
    'Calzado Casual',
    'Calzado Deportivo',
    'Ropa Casual',
    'Ropa Deportiva',
    'Accesorios',
  ];

  final List<String> genders = ['Todos', 'Hombre', 'Mujer', 'Niños'];

  final Map<String, Map<String, List<Map<String, String>>>> items = {
    'Calzado Casual': {
      'Hombre': [
        {'name': 'Zapatos casuales café sólido', 'price': '59.99', 'image': 'https://prismamoda.vtexassets.com/arquivos/ids/465200-500-auto?v=638597720245400000&width=500&height=auto&aspect=true'},
        {'name': 'Zapatos casuales negro sólido', 'price': '69.99', 'image': '	https://prismamoda.vtexassets.com/arquivos/ids/465…597720382100000&width=500&height=auto&aspect=true'},
        {'name': 'Zapatos derby Navy', 'price': '79.99', 'image': 'https://prismamoda.vtexassets.com/arquivos/ids/395254-500-auto?v=638342386182330000&width=500&height=auto&aspect=true'},
        {'name': 'Zapatos derby Navy cafe', 'price': '89.99', 'image': 'https://prismamoda.vtexassets.com/arquivos/ids/395274-500-auto?v=638342386301800000&width=500&height=auto&aspect=true'},
        {'name': 'Zapato casual  Nunn Bush café para hombre', 'price': '99.99', 'image': 'https://siman.vtexassets.com/arquivos/ids/5214751-500-auto?v=638442307885200000&width=500&height=auto&aspect=true'},
        {'name': 'Zapato casual Nunn Bush color café para hombre', 'price': '49.99', 'image': 'https://siman.vtexassets.com/arquivos/ids/5227578-500-auto?v=638446536955300000&width=500&height=auto&aspect=true'},
        {'name': 'Zapato Casual Hombre 7', 'price': '59.99', 'image': 'https://example.com/assets/shoes_men_7.jpg'},
        {'name': 'Zapato Casual Hombre 8', 'price': '69.99', 'image': 'https://example.com/assets/shoes_men_8.jpg'},
        {'name': 'Zapato Casual Hombre 9', 'price': '79.99', 'image': 'https://example.com/assets/shoes_men_9.jpg'},
        {'name': 'Zapato Casual Hombre 10', 'price': '89.99', 'image': 'https://example.com/assets/shoes_men_10.jpg'},
      ],
      'Mujer': [
        {'name': 'Zapato Casual Mujer 1', 'price': '49.99', 'image': 'https://example.com/assets/shoes_women_1.jpg'},
        {'name': 'Zapato Casual Mujer 2', 'price': '59.99', 'image': 'https://example.com/assets/shoes_women_2.jpg'},
        {'name': 'Zapato Casual Mujer 3', 'price': '69.99', 'image': 'https://example.com/assets/shoes_women_3.jpg'},
        {'name': 'Zapato Casual Mujer 4', 'price': '79.99', 'image': 'https://example.com/assets/shoes_women_4.jpg'},
        {'name': 'Zapato Casual Mujer 5', 'price': '89.99', 'image': 'https://example.com/assets/shoes_women_5.jpg'},
        {'name': 'Zapato Casual Mujer 6', 'price': '99.99', 'image': 'https://example.com/assets/shoes_women_6.jpg'},
        {'name': 'Zapato Casual Mujer 7', 'price': '49.99', 'image': 'https://example.com/assets/shoes_women_7.jpg'},
        {'name': 'Zapato Casual Mujer 8', 'price': '59.99', 'image': 'https://example.com/assets/shoes_women_8.jpg'},
        {'name': 'Zapato Casual Mujer 9', 'price': '69.99', 'image': 'https://example.com/assets/shoes_women_9.jpg'},
        {'name': 'Zapato Casual Mujer 10', 'price': '79.99', 'image': 'https://example.com/assets/shoes_women_10.jpg'},
      ],
      'Niños': [
        {'name': 'Zapato Casual Niños 1', 'price': '39.99', 'image': 'https://example.com/assets/shoes_kids_1.jpg'},
        {'name': 'Zapato Casual Niños 2', 'price': '29.99', 'image': 'https://example.com/assets/shoes_kids_2.jpg'},
        {'name': 'Zapato Casual Niños 3', 'price': '49.99', 'image': 'https://example.com/assets/shoes_kids_3.jpg'},
        {'name': 'Zapato Casual Niños 4', 'price': '39.99', 'image': 'https://example.com/assets/shoes_kids_4.jpg'},
        {'name': 'Zapato Casual Niños 5', 'price': '29.99', 'image': 'https://example.com/assets/shoes_kids_5.jpg'},
        {'name': 'Zapato Casual Niños 6', 'price': '39.99', 'image': 'https://example.com/assets/shoes_kids_6.jpg'},
        {'name': 'Zapato Casual Niños 7', 'price': '49.99', 'image': 'https://example.com/assets/shoes_kids_7.jpg'},
        {'name': 'Zapato Casual Niños 8', 'price': '29.99', 'image': 'https://example.com/assets/shoes_kids_8.jpg'},
        {'name': 'Zapato Casual Niños 9', 'price': '39.99', 'image': 'https://example.com/assets/shoes_kids_9.jpg'},
        {'name': 'Zapato Casual Niños 10', 'price': '29.99', 'image': 'https://example.com/assets/shoes_kids_10.jpg'},
      ],
    },
    'Calzado Deportivo': {
      'Hombre': [
        {'name': 'Zapatillas Deportivas Hombre', 'price': '29.99', 'image': 'https://example.com/assets/sport_shoes_men.jpg'},
      ],
      'Mujer': [
        {'name': 'Zapatillas Deportivas Mujer', 'price': '34.99', 'image': 'https://example.com/assets/sport_shoes_women.jpg'},
      ],
      'Niños': [
        {'name': 'Zapatillas Deportivas Niños', 'price': '19.99', 'image': 'https://example.com/assets/sport_shoes_kids.jpg'},
      ],
    },
    'Ropa Casual': {
      'Hombre': [
        {'name': 'Camiseta Casual Hombre', 'price': '14.99', 'image': 'https://example.com/assets/tshirt_men.jpg'},
      ],
      'Mujer': [
        {'name': 'Vestido Casual Mujer', 'price': '34.99', 'image': 'https://example.com/assets/dress_women.jpg'},
      ],
      'Niños': [
        {'name': 'Camisa Casual Niños', 'price': '24.99', 'image': 'https://example.com/assets/tshirt_kids.jpg'},
      ],
    },
    'Ropa Deportiva': {
      'Hombre': [
        {'name': 'Pantalones Deportivos Hombre', 'price': '24.99', 'image': 'https://example.com/assets/sport_pants_men.jpg'},
      ],
      'Mujer': [
        {'name': 'Pantalones Deportivos Mujer', 'price': '22.99', 'image': 'https://example.com/assets/sport_pants_women.jpg'},
      ],
      'Niños': [
        {'name': 'Pantalones Deportivos Niños', 'price': '19.99', 'image': 'https://example.com/assets/sport_pants_kids.jpg'},
      ],
    },
    'Accesorios': {
      'Hombre': [
        {'name': 'Reloj de Pulsera Hombre', 'price': '59.99', 'image': 'https://example.com/assets/watch_men.jpg'},
      ],
      'Mujer': [
        {'name': 'Cartera Elegante Mujer', 'price': '49.99', 'image': 'https://example.com/assets/bag_women.jpg'},
      ],
      'Niños': [
        {'name': 'Mochila Niños', 'price': '29.99', 'image': 'https://example.com/assets/backpack_kids.jpg'},
      ],
    },
  };

  List getFilteredItems() {
    if (selectedCategory == 'Selecciona una categoría' && selectedGender == 'Todos') {
      return items.values.expand((categoryMap) {
        return categoryMap.values.expand((productList) {
          return productList;
        }).toList();
      }).toList();
    } else if (selectedCategory != 'Selecciona una categoría' && selectedGender != 'Todos') {
      final categoryItems = items[selectedCategory]?[selectedGender] ?? [];
      return categoryItems;
    } else if (selectedCategory != 'Selecciona una categoría') {
      return items[selectedCategory]?.values.expand((productList) => productList).toList() ?? [];
    } else {
      return items.values.expand((categoryMap) {
        return categoryMap[selectedGender] ?? [];
      }).toList();
    }
  }

  void addToCart(Map<String, String> item) {
    setState(() {
      cart.add(CartItem(
        name: item['name']!,
        price: double.parse(item['price']!),
      ));
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${item['name']} agregado al carrito'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ofertas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
            },
            items: categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
          ),
          DropdownButton<String>(
            value: selectedGender,
            onChanged: (newValue) {
              setState(() {
                selectedGender = newValue!;
              });
            },
            items: genders.map((gender) {
              return DropdownMenuItem(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: getFilteredItems().length,
              itemBuilder: (BuildContext context, int index) {
                final item = getFilteredItems()[index];
                return Card(
                  child: Column(
                    children: [
                      // Cargar la imagen desde internet
                      Image.network(
                        item['image']!,
                        fit: BoxFit.cover,
                        height: 100, // Mantener la altura de la imagen
                        width: double.infinity, // Asegurarse de que ocupe todo el ancho
                      ),
                      Text(item['name']!),
                      Text('\$${item['price']}'),
                      ElevatedButton(
                        onPressed: () => addToCart(item),
                        child: const Text('Agregar al carrito'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
