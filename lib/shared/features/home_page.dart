import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: ElevatedButton(child: const Text('Matcher'), onPressed: () {
              Navigator.of(context).pushNamed('/matcher');
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: ElevatedButton(child: const Text('Range'), onPressed: () {
              Navigator.of(context).pushNamed('/range');
            }),
          )
        ],
      ),
    );
  }
}