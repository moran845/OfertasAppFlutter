import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/shoes.dart';

class ApiService {
  final String apiUrl = "http://51.222.142.170/productos"; 

  Future<List<Shoe>> fetchShoes(int idCategoria) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'}, 
      body: json.encode({'id_categoria': idCategoria}),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Shoe.fromJson(item)).toList();
    } else {
      throw Exception('Error al cargar los zapatos: ${response.statusCode}');
    }
  }
}
