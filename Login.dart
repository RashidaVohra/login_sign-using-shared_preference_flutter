// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late SharedPreferences prefs;
  TextEditingController name1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController password1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Form',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: name1,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: email1,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: password1,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                retrieveDetails();
                print(name1);
                print(email1);
                print(password1);
              },
              child: const Text('Login'),
            ),
            //Text(name1),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }

  retrieveDetails() async {
    prefs = await SharedPreferences.getInstance();
    String? name1 = prefs.getString("username").toString();
    String? email1 = prefs.getString("useremail").toString();
    String? password1 = prefs.getString("userpass").toString();
    print(name1);
    print(email1);
    print(password1);

    setState(() {
      name1 = "Retrieved";
    });
    setState(() {
      email1 = "Retrieved";
    });
    setState(() {
      password1 = "Retrieved";
    });
  }
}
