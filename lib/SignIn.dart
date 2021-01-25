import 'package:flutter/material.dart';
import 'package:flutter_login_form_app/SignUp.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _showPass = false;
  String _username = '';
  String _password = '';

  Image logo() {
    return Image.asset('assets/logo.png', height: 60);
  }

  TextFormField username() {
    return TextFormField(
      onChanged: (text) {
        this.setState(() {
          _username = text;
        });
      },
      style: TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        hintText: 'USERNAME',
        labelText: 'USERNAME',
        hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        labelStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    );
  }

  TextFormField password() {
    return TextFormField(
      onChanged: (text) {
        this.setState(() {
          _password = text;
        });
      },
      style: TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        hintText: 'PASSWORD',
        labelText: 'PASSWORD',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        labelStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      obscureText: _showPass,
    );
  }

  RaisedButton loginButton() {
    return RaisedButton(
      child: const Text('SIGN IN', style: TextStyle(color: Colors.white)),
      color: Colors.blue.withOpacity(0.6),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)),
      elevation: 4.0,
      splashColor: Theme.of(context).primaryColor,
      onPressed: () {
        // Perform some action
        _showMyDialog();
      },
    );
  }

  FlatButton signInButton() {
    return FlatButton(
      onPressed: () {
        // Perform some action
      },
      child: Text(
        "DON'T HAVE AN ACCOUNT? SIGN UP",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  FlatButton signUpButtonShow() {
    return FlatButton(
        onPressed: () {
          // Perform some action
          this.setState(() {
            _showPass = !_showPass;
          });
        },
        padding: EdgeInsets.all(0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            _showPass ? "SHOW" : "HIDE",
            style: TextStyle(color: Colors.blue[400]),
            textAlign: TextAlign.left,
          ),
        ));
  }

  Widget signInTitle() {
    return Text(
      "Hello😄\nWellCome Back",
      style: TextStyle(color: Colors.black, fontSize: 40),
    );
  }

  Widget body(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portrait();
    } else {
      return landscape();
    }
  }

  Widget signNewUser(text) {
    return Text(
      "$text",
      style: TextStyle(color: Colors.black, fontSize: 13),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('System Notification'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('SignIn Success'),
                Text(
                  'Username: $_username  and Password  $_password',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  FlatButton signUpButton() {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpPage(),
          ),
        );
        // Perform some action
      },
      child: Text(
        "SIGN UP",
        style: TextStyle(color: Colors.blue),
      ),
      padding: const EdgeInsets.only(bottom: 50.0, right: 25),
    );
  }

  Widget portrait() {
    return new Container(
      // decoration: new BoxDecoration(
      //   image: new DecorationImage(
      //     image: new ExactAssetImage('assets/background.jpg'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Theme(
        data: Theme.of(context).copyWith(
          //make labels and border white when not focused
          hintColor: Colors.white,
          textTheme: TextTheme(
              //make text value white
              body1: TextStyle(color: Colors.white)),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        // child: logo(),
                        child: FlutterLogo(),
                        // margin: EdgeInsets.symmetric(vertical: 30),
                        // alignment: Alignment.bottomCenter,

                        width: 70,
                        height: 70,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue[100]),
                      ),
                    ],
                  )),
              Expanded(
                child: Container(
                  child: signInTitle(),
                  alignment: Alignment.bottomCenter,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: username(),
                  alignment: Alignment.bottomCenter,
                ),
                flex: 1,
              ),
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Container(
                      child: password(),
                      margin: EdgeInsets.only(top: 12),
                      alignment: Alignment.topCenter,
                    ),
                    Container(
                      child: SizedBox(
                        width: 100,
                        child: signUpButtonShow(),
                      ),
                      margin: const EdgeInsets.only(bottom: 40.0),
                    ),
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: SizedBox(
                    width: 300,
                    child: loginButton(),
                  ),
                  // color: Colors.red,
                  alignment: Alignment.topCenter,
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Text(
                                    "NEW USER?",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: signUpButton(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            child: signNewUser('FORGOT PASSWORD'),
                          ),
                        ],
                      ),
                    ]),
                flex: 1,
              ),
              // Expanded(
              //   child: Container(
              //     child: signUpButton(),
              //     alignment: Alignment.bottomCenter,
              //   ),
              //   flex: 1,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget landscape() {
    return new Stack(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 80),
          child: logo(),
        ),
        Theme(
          data: Theme.of(context).copyWith(
            //make labels and border white when not focused
            hintColor: Colors.white,
            textTheme: TextTheme(
                //make text value white
                body1: TextStyle(color: Colors.white)),
          ),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: username(),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: password(),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: SizedBox(
                          width: 400,
                          height: 200.0,
                          child: loginButton(),
                        ),
                        // margin: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: signUpButton(),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body(context));
  }
}
