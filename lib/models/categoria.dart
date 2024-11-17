class Categoria {
  final int idCategoria;
  final String nombre;
  final String descripcion;

  Categoria({required this.idCategoria, required this.nombre, required this.descripcion});

  
  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      idCategoria: json['id_categoria'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
    );
  }
}
