import 'package:flutter/material.dart';
import 'package:lets_chat/pages/main_page.dart';
import 'package:lets_chat/view_models/login_view_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String _message = "";

  final _usernameController = TextEditingController();
  final _loginVM = LoginViewModel();

  void _login(BuildContext context) async {
    final username = _usernameController.text;

    // check if username is not empty
    if (username.isEmpty) {
      setState(() {
        _message = "Username cannot be empty!";
      });
    } else {
      // perform login
      final isLoggedIn = await _loginVM.login(username);
      if (isLoggedIn) {
        // on successful login take the user to the main page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              maxRadius: 150,
              backgroundImage: AssetImage("assets/images/logo.png")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _usernameController,
            decoration: InputDecoration(hintText: "Enter username"),
          ),
        ),
        FlatButton(
            child: Text("Login"),
            onPressed: () {
              _login(context);
            },
            textColor: Colors.white,
            color: Colors.grey),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_message),
        )
      ]),
    ));
  }
}
