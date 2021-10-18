import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String buttonText;

  const HomePageButton({Key? key, required this.onPressed, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(100),
          textStyle: const TextStyle(
            fontSize: 60
          )
        )
      ),
      child: ElevatedButton(child: Text(buttonText), onPressed: onPressed),
    );
  }
}