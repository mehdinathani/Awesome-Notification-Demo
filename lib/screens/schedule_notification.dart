import 'package:awesomenotificationsdemo/components/custom_button.dart';
import 'package:awesomenotificationsdemo/functions/notification_functions.dart';
import 'package:flutter/material.dart';

class ScheduleMessage extends StatelessWidget {
  const ScheduleMessage({super.key});

  @override
  Widget build(BuildContext context) {
    // double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;
    double buttonmediaHeight = mediaHeight * 0.50;
    TextEditingController _secondscountController = TextEditingController();
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
                  "Send Message after ",
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
                    controller: _secondscountController,
                    decoration: const InputDecoration(
                      hintText: "Enter seconds",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: mediaHeight * 0.02,
                ),
                const Text(
                  " Seconds.",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mediaHeight * 0.02,
            ),
            CustomButtonForNotification(
              onPressed: () async {
                try {
                  int seconds = int.parse(_secondscountController.text);
                  // Use 'seconds' in your notification scheduling logic.
                  await showScheduleNotification(
                    "Message Sent",
                    "Your message has been sent after $seconds seconds",
                    seconds,
                  );
                } catch (e) {
                  // Handle the case where the input is not a valid number, e.g., show an error to the user.
                  print("Invalid input: ${_secondscountController.text}");
                  // You can also display an error message to the user using a SnackBar or AlertDialog.
                }
              },
              buttonText: "Schedule Now",
              buttonIcon: Icons.send_and_archive_outlined,
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
