class Shoe {
  final int idProducto;
  final String name;
  final String description;
  final String price;
  final int stock;
  final int idCategoria;
  final String image;
  final String dateAdded;

  Shoe({
    required this.idProducto,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.idCategoria,
    required this.image,
    required this.dateAdded,
  });

  factory Shoe.fromJson(Map<String, dynamic> json) {
    return Shoe(
      idProducto: json['id_producto'],
      name: json['nombre'],
      description: json['descripcion'],
      price: json['precio'],
      stock: json['stock'],
      idCategoria: json['id_categoria'],
      image: json['imagen_url'],
      dateAdded: json['fecha_agregado'],
    );
  }
}
