import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;

Future<String> fetchGoogleImageSearchResults(String query) async {
  final url =
      Uri.parse('https://www.google.com/search?q=$query&tbm=isch&source=lnms');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    return ''; // Return an empty string to indicate an error
  }
}

String extractFirstImageUrl(String htmlContent) {
  final document = htmlParser.parse(htmlContent);
  final elements = document.querySelectorAll('.rg_i');

  if (elements.isNotEmpty) {
    return elements.first.attributes['src'] ?? '';
  } else {
    return ''; // Return an empty string if no images are found
  }
}
