

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/models/room.dart';

class AddRoomViewModel extends ChangeNotifier {

  String message = "";

  Future<bool> addRoom(String title, String description) async {

    final room = Room(title: title, description: description); 
    bool isSaved = false; 

    try {
      await FirebaseFirestore.instance.collection("rooms")
        .add(room.toMap()); 
        isSaved = true; 
    } catch(e) {
      message = "Error adding a room"; 
    }

    notifyListeners(); 
    return isSaved;
  }

}