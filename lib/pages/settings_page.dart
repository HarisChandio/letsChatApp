

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  void _signOut() {
    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          FlatButton(
            child: Text("Sign Out"), 
            onPressed: _signOut,
            textColor: Colors.white,
            color: Colors.grey
          )
        ]),
      )
    );
    
  }
}