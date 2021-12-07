import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'first.dart';

class second extends StatefulWidget {
  String url;
  String name;
  String email;
  second({
    required this.url,
    required this.name,
    required this.email,
  });
  @override
  _secondState createState() => _secondState(
        url: url,
        name: name,
        email: email,
      );
}

class _secondState extends State<second> {
  String url;
  String name;
  String email;
  _secondState({
    required this.url,
    required this.name,
    required this.email,
  });
  GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Row(
          children: [
            Text(
              'Web',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
            Text(
              'Fun',
              style: TextStyle(
                color: Colors.yellow[700],
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              url,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 25,
                color: Colors.indigo[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              email,
              style: TextStyle(
                fontSize: 25,
                color: Colors.indigo[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            MaterialButton(
              color: Colors.indigo[900],
              onPressed: () {
                _googleSignIn.signOut().then((value) {
                  setState(() {});
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (firstpage()),
                    ),
                  );
                }).catchError((e) {});
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
