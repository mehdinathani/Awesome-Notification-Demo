import 'package:flutter/material.dart';

class UpdateView extends StatelessWidget {
  const UpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Updates Available"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(38.0),
              child: Text(
                textAlign: TextAlign.center,
                "We are installing the latest update in your mobile",
                style: TextStyle(fontSize: 34),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
