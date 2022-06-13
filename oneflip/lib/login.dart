import 'package:flutter/material.dart';
import 'package:oneflip/pages/home.dart';
import 'package:oneflip/pages/level.dart';
import 'package:oneflip/pages/easy.dart';
import 'package:oneflip/pages/medium.dart';
import 'package:oneflip/pages/hard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

@override
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  late String _userID, _passw;
  final auth = FirebaseAuth.instance;
  bool isLoading = false;

  doAnanoLogin() async {
    setState(() {
      isLoading = true;
    });
    UserCredential userCredential =
    await FirebaseAuth.instance.signInAnonymously();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Page2()));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), actions: [
        FlatButton(
            onPressed: () {
              doAnanoLogin();
            },
            child: Text(
              "Guste",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.black),
            ))
      ]),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _userID = value.trim();
                });
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _passw = value.trim();
                });
              },
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Signin'),
                onPressed: () {
                  auth
                      .signInWithEmailAndPassword(
                      email: _userID, password: _passw)
                      .then((_) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Page2()));
                  });
                }),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Signup'),
              onPressed: () {
                auth
                    .createUserWithEmailAndPassword(
                    email: _userID, password: _passw)
                    .then((_) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Page2()));
                });
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      child: Text('login as Guest'),
                      onPressed: () {},
                    )
                  ],
                );
              },
            )
          ])
        ],
      ),
    );
  }
}