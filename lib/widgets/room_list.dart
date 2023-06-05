

import 'package:flutter/material.dart';
import 'package:lets_chat/view_models/room_view_model.dart';

class RoomList extends StatelessWidget {

  final List<RoomViewModel> rooms; 
  final Function(RoomViewModel) onRoomSelected; 

  RoomList({@required this.rooms, this.onRoomSelected});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: rooms.length, 
      itemBuilder: (context, index) {

        final room = rooms[index];

        return ListTile(
          title: Text(room.title), 
          trailing: Icon(Icons.arrow_forward_ios),
          subtitle: Text(room.description), 
          onTap: () {
            onRoomSelected(room);
          },
        );
      }
    );
    
  }
}