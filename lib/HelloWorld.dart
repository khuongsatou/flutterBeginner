import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.pink,
                    title: Text("Cua nàng flutter")),
                body: Center(child: Text('Hi bạn, cho mình làm quen nhé!')))));
  }
}
