import 'package:awesomenotificationsdemo/components/custom_button.dart';
import 'package:awesomenotificationsdemo/config.dart';
import 'package:awesomenotificationsdemo/functions/notification_functions.dart';
import 'package:awesomenotificationsdemo/functions/ussplashimage.dart';
import 'package:awesomenotificationsdemo/global.dart';
import 'package:flutter/material.dart';

class BigImageNotification extends StatelessWidget {
  const BigImageNotification({super.key});

  @override
  Widget build(BuildContext context) {
    // double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;
    // double buttonmediaHeight = mediaHeight * 0.50;
    TextEditingController _searchedImageName = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule Messages"),
      ),
      body: Container(
        // color: Colors.blueAccent,
        child: Column(
          children: [
            SizedBox(
              height: mediaHeight * 0.02,
            ),
            Column(
              children: [
                SizedBox(
                  height: mediaHeight * 0.05,
                ),
                const Text(
                  "Show me image for",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: mediaHeight * 0.02,
                ),
                SizedBox(
                  width: mediaHeight * 0.5,
                  child: TextField(
                    controller: _searchedImageName,
                    decoration: const InputDecoration(
                      hintText: "Enter image name you want",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: mediaHeight * 0.02,
                ),
              ],
            ),
            SizedBox(
              height: mediaHeight * 0.02,
            ),
            CustomButtonForNotification(
              onPressed: () async {
                final apiKey = apiKeys.unsplashapiaccesskey;
                final results =
                    await searchUnsplashPhotos(_searchedImageName.text, apiKey);

                // Extract image URLs from the API response
                final imageUrls =
                    results.map((photo) => photo['urls']['regular']).toList();

                debugPrint(imageUrls[0]);
                searchItem = _searchedImageName.text;
                searchItemURL = imageUrls[0];

                try {
                  await showBigPictureNotificationWithNavigation(
                      _searchedImageName.text,
                      "Your searched image found.",
                      "You have searched ${_searchedImageName.text}, showing first result,click in the notification to view",
                      imageUrls[0],
                      "Image",
                      _searchedImageName.text,
                      Colors.black,
                      "/bigImage");
                } catch (e) {
                  // Handle the case where the input is not a valid number, e.g., show an error to the user.
                  debugPrint("Invalid input: ${_searchedImageName.text}");
                  // You can also display an error message to the user using a SnackBar or AlertDialog.
                }
              },
              buttonText: "Search",
              buttonIcon: Icons.search,
            ),
            SizedBox(
              height: mediaHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
