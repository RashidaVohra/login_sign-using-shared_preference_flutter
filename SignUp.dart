// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';

// ignore: camel_case_types
class SignUp_Preferences extends StatefulWidget {
  const SignUp_Preferences({Key? key}) : super(key: key);

  @override
  State<SignUp_Preferences> createState() => _SignUp_PreferencesState();
}

class _SignUp_PreferencesState extends State<SignUp_Preferences> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String uname = "";
  String uemail = "";
  String upass = "";
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SignUp Using Shared Preferences',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 5.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  hintText: 'Enter Name',
                  icon: Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: 'Enter Email',
                  icon: Icon(Icons.mail),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  hintText: 'Enter Password',
                  icon: Icon(Icons.security),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  saveDetails();
                  print('Clicked');
                  print(uname);
                  print(uemail);
                  print(upass);
                },
                child: const Text('SignUp'),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(uname),
              Text(uemail),
              Text(upass),
              const Divider(),
              const Text(
                'Already Signed Up?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Login()));
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  saveDetails() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", name.text.toString());
    await prefs.setString("useremail", email.text.toString());
    await prefs.setString("userpass", password.text.toString());
    setState(() {
      uname = "Name Saved";
    });
    setState(() {
      uemail = "Email Saved";
    });
    setState(() {
      upass = "Password Saved";
    });
  }
}
