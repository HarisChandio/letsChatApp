

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_chat/models/room.dart';
import 'package:lets_chat/view_models/room_view_model.dart';

class RoomListViewModel {

  Future<List<RoomViewModel>> getAllRooms() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("rooms").get();
    final rooms = snapshot.docs.map((doc) => Room.fromDocument(doc)).toList();
    return rooms.map((room) => RoomViewModel(room: room)).toList();
  }

}