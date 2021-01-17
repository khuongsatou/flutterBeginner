import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Well come to Flutter1',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Well come to flutter2'),
          ),
          body: Center(child: Text('Hello World')),
        ));
  }
}
