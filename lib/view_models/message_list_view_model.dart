import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:lets_chat/models/message.dart';
import 'package:lets_chat/view_models/message_view_model.dart';
import 'package:lets_chat/view_models/room_view_model.dart';

class MessageListViewModel {

  final RoomViewModel room; 
  final messagesStream = StreamController<List<MessageViewModel>>(); 

  MessageListViewModel({@required this.room}) {
    _subscribeToMessagesStream(); 
  } 

  void _subscribeToMessagesStream() {

    FirebaseFirestore.instance.collection("messages")
      .where("roomId", isEqualTo: room.roomId)
      .orderBy("dateCreated", descending: false)
      .snapshots().listen((data) {
        
        final messages = data.docs.map((doc) => Message.fromDocument(doc)).toList(); 
        final messagesViewModel = messages.map((message) => MessageViewModel(message: message)).toList();

        messagesStream.sink.add(messagesViewModel); 

      });

  }

  Future<bool> sendMessage(String roomId, String messageText, String username) async {

    final message = Message(roomId: roomId, messageText: messageText, username: username, dateCreated: DateTime.now()); 
    bool isSaved = false; 

    try {
      await FirebaseFirestore.instance.collection("messages")
        .add(message.toMap()); 
      isSaved = true; 
    } catch(e) {
      print(e);
    }

    return isSaved; 

  }


}