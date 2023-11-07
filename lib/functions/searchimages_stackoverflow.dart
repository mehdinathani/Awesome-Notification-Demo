import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

Future<void> main() async {
  List<String> imageList = await getImageByDom('hyderabad');

  print(imageList);
}

Future<List<String>> getImageByDom(String city) async {
  final Map<String, String> headers = {
    HttpHeaders.userAgentHeader:
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36'
  };

  final response = await http.get(
    Uri.parse(
        'https://www.google.com.pk/search?q=$city+city&tbm=isch&ved=2ahUKEwiK5_jmqt_uAhWE4oUKHSH-DRYQ2-cCegQIABAA'),
    headers: headers,
  );

  if (response.statusCode != HttpStatus.ok) {
    return [];
  }

  var document = parse(response.body);

  final elements = document.querySelectorAll('.bRMDJf');

  final imageUrls = elements
      .map((a) => a.querySelector('img')?.attributes['src'])
      .where((src) => src != null)
      .map((src) => src!)
      .toList();

  return imageUrls;
}
