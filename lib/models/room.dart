
import 'package:cloud_firestore/cloud_firestore.dart';

class Room {

  String roomId; 
  final String title; 
  final String description; 

  Room({this.roomId, this.title, this.description});

  Map<String, dynamic> toMap() {
    return {"title": title, "description": description};
  }

  factory Room.fromDocument(QueryDocumentSnapshot doc) {
    return Room(
      roomId: doc.id,
      title: doc["title"],
      description: doc["description"],
    );
  }

}