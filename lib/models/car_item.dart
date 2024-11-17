class CartItem {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;  // Nueva propiedad para la URL de la imagen

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.imageUrl,  // Asegúrate de inicializarla
  });

  // Calcula el precio total basado en la cantidad
  double get totalPrice => price * quantity;
}
