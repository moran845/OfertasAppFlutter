class CartItem {
  final String name;
  final double price;
  final int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;
}
