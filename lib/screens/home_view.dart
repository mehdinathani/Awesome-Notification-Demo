import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesomenotificationsdemo/services/notification_service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;
    double buttonmediaHeight = mediaHeight * 0.16;
    TextEditingController _secondscountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                height: buttonmediaHeight,
                child: GestureDetector(
                  onTap: () async {
                    await NotificationService.showNotification(
                        title: "Thank you for subscription",
                        body: "You have subscribe our Channel.");
                  },
                  child: Image.network(
                      "https://i.pinimg.com/736x/43/b9/22/43b9225e5cbf1b58e3b4bebe6ff4d1ad.jpg"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: buttonmediaHeight,
                child: GestureDetector(
                  onTap: () async {
                    await NotificationService.showNotification(
                        title: "Event Marked",
                        body: "Todays Day is ${DateTime.now()} }",
                        summary: "Today is special.");
                  },
                  child: Image.network(
                      "https://previews.123rf.com/images/valentint/valentint1612/valentint161200981/66630578-save-the-date-icon-save-the-date-website-button-on-white-background.jpg"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: buttonmediaHeight,
                child: GestureDetector(
                  onTap: () async {
                    await NotificationService.showNotification(
                      title: "Please Wait",
                      body: "We are updating your contacts.",
                      notificationLayout: NotificationLayout.ProgressBar,
                    );

                    // Delay the cancellation of the notification by 5 seconds
                    Future.delayed(const Duration(seconds: 3), () async {
                      // Cancel the notification after 5 seconds
                      await AwesomeNotifications().cancel(0);
                    });
                  },
                  child: Image.network(
                      "https://cdn0.iconfinder.com/data/icons/social-network-27/32/contact_sync_info_user_data_information_synchronization-512.png"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: buttonmediaHeight,
                child: GestureDetector(
                  onTap: () async {
                    var rng = new Random();
                    var code = rng.nextInt(900000) + 100000;
                    await NotificationService.showNotification(
                      title: code.toString(),
                      body: "Your OTP expires after 15 seconds.",
                      summary: "Your OTP is",
                      notificationLayout: NotificationLayout.Messaging,
                    );
                  },
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcii9U15oPqqulVH7Bc-q6DjIhj_A741Y3A-3iCPPFaXNpiziGCZmtWyg6KwCuBK9xniE&usqp=CAU"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: buttonmediaHeight,
                child: GestureDetector(
                  onTap: () async {
                    await NotificationService.showNotification(
                        title: "New Update Available",
                        body: "Click to download Latest version",
                        payload: {
                          'navigate': "true",
                        },
                        actionButtons: [
                          NotificationActionButton(
                            key: "Update",
                            label: "Update Now",
                            actionType: ActionType.SilentAction,
                            color: Colors.black,
                          )
                        ]);
                  },
                  child: Image.network(
                      "https://m.media-amazon.com/images/I/61EwzijM2XL.png"),
                ),
              ),
              Container(
                color: Colors.blueAccent,
                child: Column(
                  children: [
                    SizedBox(
                      height: mediaHeight * 0.02,
                    ),
                    Row(
                      children: [
                        const Text("Send Message after "),
                        Flexible(
                          child: TextField(
                            controller: _secondscountController,
                            decoration: const InputDecoration(
                              hintText: "Enter seconds",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Text(" Seconds."),
                      ],
                    ),
                    SizedBox(
                      height: mediaHeight * 0.02,
                    ),
                    Container(
                      width: buttonmediaHeight,
                      child: GestureDetector(
                        onTap: () {
                          try {
                            int seconds =
                                int.parse(_secondscountController.text);
                            // Use 'seconds' in your notification scheduling logic.
                            NotificationService.showNotification(
                              title: "Message Sent",
                              body:
                                  "Your message has been sent after $seconds seconds",
                              scheduled: true,
                              interval: seconds,
                            );
                          } catch (e) {
                            // Handle the case where the input is not a valid number, e.g., show an error to the user.
                            print(
                                "Invalid input: ${_secondscountController.text}");
                            // You can also display an error message to the user using a SnackBar or AlertDialog.
                          }
                        },
                        child: Image.network(
                            "https://lh3.googleusercontent.com/B1Ki0g1sUxvKm16VZLpCqbzGegRmAVQiqRYwk00YRuMsiDX8JzQzPHCfS3q0EYP52j9f"),
                      ),
                    ),
                    SizedBox(
                      height: mediaHeight * 0.02,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
