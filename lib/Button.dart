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
                body: ColumnWidget())));
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Column(children: [
      Text('Hi bạn cho mình làm quen nhá.'),
      Row(children: [
        FlatButton(
          onPressed: () {},
          child: Text('red'),
          color: Colors.red,
        ),
        FlatButton(
          onPressed: () {},
          child: Text('yellow'),
          color: Colors.yellow,
        ),
        FlatButton(
            onPressed: () {
              // CounterTextWidget();
            },
            child: Text('green'),
            color: Colors.green)
      ])
    ]);
  }
}

class CounterTextWidget extends StatelessWidget {
  int counter;

  Widget build(BuildContext context) {
    return Text('Tui laf 1 widget. data cua tui hien tai, $counter');
  }
}
