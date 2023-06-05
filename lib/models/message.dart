

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Message {

  String messageId; 
  String roomId; 
  final String messageText; 
  final String username; 
  final DateTime dateCreated; 

  Message({@required this.roomId, this.messageId, @required this.messageText, @required this.username, this.dateCreated}); 

  Map<String, dynamic> toMap() {
     return {
      "roomId": roomId, 
      "messageText": messageText, 
      "username": username, 
      "dateCreated": dateCreated 
    };
  }

  factory Message.fromDocument(QueryDocumentSnapshot doc) {
     return Message(
      messageId: doc.id,
      roomId: doc["roomId"],
      messageText: doc["messageText"],
      username: doc["username"],
      dateCreated: doc["dateCreated"].toDate()
    );
  }


}