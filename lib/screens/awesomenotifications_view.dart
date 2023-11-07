import 'dart:math';

import 'package:awesomenotificationsdemo/components/custom_button.dart';
import 'package:awesomenotificationsdemo/functions/notification_functions.dart';
import 'package:awesomenotificationsdemo/screens/image_notification_input.dart';
import 'package:awesomenotificationsdemo/screens/schedule_notification.dart';
import 'package:flutter/material.dart';

class AwesomeNotificationView extends StatelessWidget {
  const AwesomeNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Awesome Notifications.")),
      ),
      body: Center(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CustomButtonForNotification(
                onPressed: () async {
                  await showBasicNotification("You have subscribed",
                      "Thank you for your Subscribtion of our Channel");
                },
                buttonText: "Subscribe",
                buttonIcon: Icons.subscriptions),
            CustomButtonForNotification(
                onPressed: () async {
                  await showNotificationWithSummmary("Event Marked",
                      "Todays Day is ${DateTime.now()} }", "Today is special.");
                },
                buttonText: "Mark the Date",
                buttonIcon: Icons.date_range_outlined),
            CustomButtonForNotification(
                onPressed: () async {
                  await showProgressBarNotification(
                    "Please Wait",
                    "We are updating your contacts.",
                    3,
                  );
                },
                buttonText: "Sync Contacts",
                buttonIcon: Icons.sync),
            CustomButtonForNotification(
                onPressed: () async {
                  var rng = Random();
                  var code = rng.nextInt(900000) + 100000;
                  await showMessagingNotification(code.toString(),
                      "Your OTP expires after 15 seconds.", "Your OTP is");
                },
                buttonText: "Get OTP",
                buttonIcon: Icons.verified_outlined),
            CustomButtonForNotification(
                onPressed: () async {
                  await showActionNotificaion(
                    "New Update Available",
                    "Click to download Latest version",
                    "Update",
                    "Update Now",
                    Colors.black,
                    "/update",
                  );
                },
                buttonText: "Check Update",
                buttonIcon: Icons.update),
            CustomButtonForNotification(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScheduleMessage(),
                    ),
                  );
                },
                buttonText: "Schedule MSG",
                buttonIcon: Icons.message),
            CustomButtonForNotification(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BigImageNotification(),
                    ),
                  );
                },
                buttonText: "Get Image",
                buttonIcon: Icons.image)
          ]),
        ),
      ),
    );
  }
}
