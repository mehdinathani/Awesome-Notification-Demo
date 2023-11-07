import 'package:awesomenotificationsdemo/components/custom_button.dart';
import 'package:awesomenotificationsdemo/functions/notification_functions.dart';
import 'package:awesomenotificationsdemo/functions/search_image.dart';
import 'package:awesomenotificationsdemo/functions/searchimage_bard.dart';
import 'package:awesomenotificationsdemo/functions/searchimages_stackoverflow.dart';
import 'package:flutter/material.dart';

class BigImageNotification extends StatelessWidget {
  const BigImageNotification({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;
    double buttonmediaHeight = mediaHeight * 0.50;
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
                // // List imagelist = await getImageByDom(_searchedImageName.text);
                // // debugPrint(
                // //   imagelist.toString(),
                // // );

                // String firtimage =
                //     await getFirstImageUrl(_searchedImageName.text);
                // debugPrint("result $firtimage");
                try {
                  //   String query =
                  //       _searchedImageName.text; // Replace with the user's query

                  //   String htmlContent =
                  //       await fetchGoogleImageSearchResults(query);
                  //   String imageUrl = extractFirstImageUrl(htmlContent);

                  await showBigPictureNotificationWithNavigation(
                      _searchedImageName.text,
                      "Your searched image found.",
                      "You have searched ${_searchedImageName.text}, showing first result,click in the notification to view",
                      "bigPictureLink",
                      "Image",
                      "imageUrl",
                      Colors.black,
                      "/bigImage");
                } catch (e) {
                  // Handle the case where the input is not a valid number, e.g., show an error to the user.
                  print("Invalid input: ${_searchedImageName.text}");
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
