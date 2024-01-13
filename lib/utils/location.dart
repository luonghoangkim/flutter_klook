import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//AIzaSyAADJ3N9W9iBD5LJK1QyaRVwWVF-1aTdlI
class PlacesApiUtil extends GetxController {
  RxList<Map<String, dynamic>> placesList = <Map<String, dynamic>>[].obs;

  Future<void> searchPlaces(String input) async {
    final apiKey = "AIzaSyAADJ3N9W9iBD5LJK1QyaRVwWVF";
    final apiUrl =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json';

    final response = await http.get(
      Uri.parse(
          '$apiUrl?input=$input&inputtype=textquery&fields=formatted_address,name,geometry&key=$apiKey'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final predictions = data['candidates'] as List<dynamic>;

      placesList.assignAll(predictions.cast<Map<String, dynamic>>());

      // Log the data for verification
      print('Response: $placesList');
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
    }
  }
}
