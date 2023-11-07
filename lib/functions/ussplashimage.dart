import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> searchUnsplashPhotos(
    String query, String apiKey) async {
  final response = await http.get(
    Uri.parse('https://api.unsplash.com/search/photos?query=$query'),
    headers: {
      'Authorization': 'Client-ID $apiKey',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final List<dynamic> results = data['results'];

    // Process the data as needed
    return results.cast<Map<String, dynamic>>();
  } else {
    throw Exception('Failed to load photos');
  }
}
