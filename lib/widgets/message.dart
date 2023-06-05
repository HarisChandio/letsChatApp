
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Message extends StatefulWidget {

  final String messageText; 
  final String senderUserName; 
  String currentUserName; 

  Message({this.messageText, this.senderUserName}); 

  @override 
  _Message createState() => _Message(); 
}

class _Message extends State<Message> {

  String _currentUserName; 
  bool _messageByCurrentUser = false; 

  @override
  void initState() {
    super.initState();
    _setUserName(); 
  }

  void _setUserName() async {
    final sharedPreferences = await SharedPreferences.getInstance(); 
    final username = sharedPreferences.getString("username");
    setState(() {
      _messageByCurrentUser = username == widget.senderUserName; 
    });
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: _messageByCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7
                  ),
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.messageText, style: TextStyle(color: Colors.white)
                ),
              ), 
              color: _messageByCurrentUser ? Colors.green : Colors.grey
          ),
            )],
      ),
    );

  }
}