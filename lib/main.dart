import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(); 
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Lets Chat",
      theme: ThemeData(
        primaryColor: const Color(0xFF27ae60)
      ),
      home: LoginPage() 
    );
    
  }
}
