import 'package:flutter/material.dart';

class CustomButtonForNotification extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final IconData buttonIcon;

  const CustomButtonForNotification({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.09,
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.amber)),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                buttonIcon,
                size: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 38),
                ),
              ),
            ],
          )),
    );
  }
}
