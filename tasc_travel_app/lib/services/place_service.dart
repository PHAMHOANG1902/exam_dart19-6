import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/place.dart';

class PlaceService {
  final String baseUrl = "http://localhost:8080/api/places";

  Future<List<Place>> getAllPlaces() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Place.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load places");
    }
  }
}