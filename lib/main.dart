import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Builder(
                builder: (context) => FlatButton(
                    child: Text('show snackbar'),
                    color: Colors.pink,
                    onPressed: () {
                      final snackBar = SnackBar(
                          content: Text(
                              'Không thể truy cập bài viết vì không có vote'));
                      Scaffold.of(context).showSnackBar(snackBar);
                    }))));
  }
}
