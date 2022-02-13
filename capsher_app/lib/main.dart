import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Welcome to the app'),
          foregroundColor: Colors.red,
        ),
        body: Center(
          child: Container(
            child: const Text('Hi there!'),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            width: 300,
          ),
        ),

        backgroundColor: Colors.grey,
      ),
    );
  }
}
