import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String buttonText;

  const HomePageButton({Key? key, required this.onPressed, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(child: Text(buttonText), onPressed: onPressed);
  }
}