import 'package:awesomenotificationsdemo/global.dart';
import 'package:flutter/material.dart';

class BigImageView extends StatefulWidget {
  const BigImageView({super.key});

  @override
  State<BigImageView> createState() => _BigImageViewState();
}

class _BigImageViewState extends State<BigImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searchItem),
      ),
      body: SafeArea(
          child: Container(
        child: Image.network(searchItemURL),
      )),
    );
  }
}
