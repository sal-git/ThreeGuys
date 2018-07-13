import 'package:flutter/material.dart';
import '../main.dart';


///Login info 

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: loginBody(context),
      ),
    );
  }

  loginBody(BuildContext context) => new Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[loginHeader(), loginFields(context)],
  );

  loginHeader() => new Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
//      new FlutterLogo(
//        colors: Colors.blue,
//        size: 80.0,
//      ),
      new Image.asset('assets/chest.png'),
      new SizedBox(
        height: 30.0,
      ),
      new Text(
        "Welcome to Inventory",
        style: new TextStyle(fontWeight: FontWeight.w700, color: Colors.blue),
      ),
      new SizedBox(
        height: 5.0,

      ),
      new Text(
        "Sign in to continue",
        style: new TextStyle(color: Colors.grey),
      ),
    ],
  );

  loginFields(BuildContext context) => new Container(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          child: new TextField(
            maxLines: 1,
            decoration: new InputDecoration(
              hintText: "Enter your username",
              labelText: "Username",
            ),
          ),
        ),
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: new TextField(
            maxLines: 1,
            obscureText: true,
            decoration: new InputDecoration(
              hintText: "Enter your password",
              labelText: "Password",
            ),
          ),
        ),
        new SizedBox(
          height: 30.0,
        ),
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          width: double.infinity,
          child: new RaisedButton(
            padding: new EdgeInsets.all(12.0),
            shape: new StadiumBorder(),
            child: new Text(
              "SIGN IN",
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new HomePage()),
              );
            },
          ),
        ),
        new SizedBox(
          height: 5.0,
        ),
        new Text(
          "SIGN UP FOR AN ACCOUNT",
          style: new TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );

}