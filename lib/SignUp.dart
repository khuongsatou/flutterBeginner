import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email = '';
  String _name = '';
  String _phone = '';
  String _zipCode = '';

  Image logo() {
    return Image.asset('assets/logo.png', height: 60);
  }

  TextFormField email() {
    return TextFormField(
      onChanged: (text) {
        this.setState(() {
          _email = text;
        });
      },
      style: TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email, color: Colors.grey),
        hintText: 'Email',
        labelText: 'Email',
        hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        labelStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }

  TextFormField name() {
    return TextFormField(
      onChanged: (text) {
        this.setState(() {
          _name = text;
        });
      },
      style: TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person, color: Colors.grey),
        hintText: 'Name',
        labelText: 'Name',
        hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        labelStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }

  TextFormField phone() {
    return TextFormField(
      onChanged: (text) {
        this.setState(() {
          _phone = text;
        });
      },
      style: TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.phone, color: Colors.grey),
        hintText: 'Phone Number',
        labelText: 'Phone Number',
        hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        labelStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }

  TextFormField zipCode() {
    return TextFormField(
      onChanged: (text) {
        this.setState(() {
          _zipCode = text;
        });
      },
      style: TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.add_location_alt, color: Colors.grey),
        hintText: 'Zip code',
        labelText: 'Zip code',
        hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        labelStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }

  RaisedButton registerButton() {
    return RaisedButton(
      child: const Text('Register', style: TextStyle(color: Colors.white)),
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
                  'Email:$_email\nName:$_name\nName:$_phone\nZipCode:$_zipCode',
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
        // Perform some action
        Navigator.pop(context);
      },
      child: Text(
        "BACK",
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Expanded(
                child: Container(
                  child: email(),
                  margin: EdgeInsets.only(top: 12),
                  alignment: Alignment.topCenter,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: name(),
                  margin: EdgeInsets.only(top: 12),
                  alignment: Alignment.topCenter,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: phone(),
                  margin: EdgeInsets.only(top: 12),
                  alignment: Alignment.topCenter,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: zipCode(),
                  margin: EdgeInsets.only(top: 12),
                  alignment: Alignment.topCenter,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: SizedBox(
                    width: 100,
                    child: registerButton(),
                  ),
                  // color: Colors.red,
                  margin: EdgeInsets.only(bottom: 12),
                  alignment: Alignment.topCenter,
                ),
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Register Page",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: body(context));
  }
}
