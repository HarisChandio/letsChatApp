


import 'package:flutter/material.dart';
import 'package:lets_chat/view_models/message_list_view_model.dart';
import 'package:lets_chat/view_models/message_view_model.dart';
import 'package:lets_chat/view_models/room_view_model.dart';
import 'package:lets_chat/widgets/message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageListPage extends StatefulWidget {

  final RoomViewModel room; 

  MessageListPage({@required this.room});

  @override 
  _MessageListPage createState() => _MessageListPage(); 
}

class _MessageListPage extends State<MessageListPage> {

  MessageListViewModel _messageListVM; 
  final _scrollController = ScrollController();
  final _messageTextController = TextEditingController(); 
  
  @override
  void initState() {
    super.initState();
    _messageListVM = MessageListViewModel(room: widget.room); 
  }


  @override
  void dispose() {
    _scrollController.dispose(); 
    super.dispose(); 
  }

  void _sendMessage(BuildContext context) async {
    
    final messageText = _messageTextController.text; 
    final sharedPreferences = await SharedPreferences.getInstance(); 
    final username = sharedPreferences.get("username");

    if(messageText.isNotEmpty) {
      _messageTextController.clear(); 
      await _messageListVM.sendMessage(widget.room.roomId, messageText, username); 
    }
    
  }

  
  Widget _buildMessageList(List<MessageViewModel> messages) {

    return Expanded(
      child: ListView.builder(
        itemCount: messages.length, 
        itemBuilder: (context, index) {
          final message = messages[index]; 
          return Message(messageText: message.messageText, senderUserName: message.username); 
        },
      )
    );

  } 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.title)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<List<MessageViewModel>>(
            stream: _messageListVM.messagesStream.stream, 
            builder: (context, snapshot) {
              
              if(snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }

              switch(snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text("Loading...");
                default: 
                  if(!snapshot.hasData) {
                    return Text("No Data"); 
                  }
              }

              return _buildMessageList(snapshot.data);

            }
          )
        ,

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                    controller: _messageTextController, 
                    decoration: InputDecoration(
                      hintText: "Enter message"
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send), 
                  color: Colors.green,
                  onPressed: () {
                    _sendMessage(context); 
                  },
                )
              ],
            ),
          ),
        )
      ])
    ); 
    
  }
}