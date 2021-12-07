import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'second.dart';

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  String url = "";
  String name = "";
  String email = "";
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
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
        child: MaterialButton(
          color: Colors.indigo[900],
          child: Text(
            "Login with Google",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            _googleSignIn.signIn().then((userData) {
              setState(() {
                _userObj = userData;
                url = _userObj!.photoUrl.toString();
                name = _userObj!.displayName.toString();
                email = _userObj!.email;
              });
              ref.add({
                'name': name,
                'url': url,
                'email': email,
              });
              if (userData != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (second(
                      url: url,
                      name: name,
                      email: email,
                    )),
                  ),
                );
              }
            }).catchError((e) {
              print(e);
            });
          },
        ),
      ),
    );
  }
}
