import 'package:flutter/material.dart';
import 'package:quizapp/models/Question.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Result result;
  List<Results> results;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> fetchQuestions() async {
    var res = await http.get('https://opentdb.com/api.php?amount=20');
    print(res.body);
    var decRes = jsonDecode(res.body);
    result = Result.fromJson(decRes);
    results = result.results;
  }

  ListView questionList() {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Text('${index + 1} ${results[index].category}'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchQuestions(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) return errorData(snapshot);
            return questionList();
        }
        return null;
      },
    );
  }

  Padding errorData(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error: ${snapshot.error}',
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Text("Try Again"),
            onPressed: () {
              fetchQuestions();
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
