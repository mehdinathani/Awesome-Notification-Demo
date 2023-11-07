import 'package:web_scraper/web_scraper.dart';

Future<String> getFirstImageUrl(String searchQuery) async {
  // Get the Google Images search URL.
  String googleImagesUrl =
      'https://www.google.com/search?q=$searchQuery&tbm=isch';

  // Create a web scraper object.
  var webScraper = WebScraper();

  // Load the Google Images search URL.
  await webScraper.loadFullURL(googleImagesUrl);

  // Extract the URL of the first image.
  String firstImageUrl = webScraper.getElement(
      'div.islrc > div > a.wXeWr.islib.nfEiy > div.bRMDJf.islir > img',
      ['src'])[0]['src'];

  // Return the URL of the first image.
  return firstImageUrl;
}
