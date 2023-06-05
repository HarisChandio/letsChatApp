
import 'package:flutter/material.dart';
import 'package:lets_chat/pages/add_room_page.dart';
import 'package:lets_chat/pages/message_list_page.dart';
import 'package:lets_chat/view_models/add_room_view_model.dart';
import 'package:lets_chat/view_models/room_list_view_model.dart';
import 'package:lets_chat/view_models/room_view_model.dart';
import 'package:lets_chat/widgets/room_list.dart';
import 'package:provider/provider.dart';

class RoomListPage extends StatefulWidget {
  @override 
  _RoomListPage createState() => _RoomListPage(); 
}

class _RoomListPage extends State<RoomListPage> {

  RoomListViewModel _roomListVM = RoomListViewModel(); 
  List<RoomViewModel> _rooms = List<RoomViewModel>(); 

  @override
  void initState() {
    super.initState();
    _populateRooms(); 
  }

  void _populateRooms() async {
    final rooms = await _roomListVM.getAllRooms();
    setState(() {
      _rooms = rooms; 
    });
  }


  void _navigateToAddRoomPage(BuildContext context) async {
    
    bool roomAdded = await Navigator.push(context, MaterialPageRoute(
      builder: (context) => 
      ChangeNotifierProvider(
        create: (context) => AddRoomViewModel(), 
        child: AddRoomPage() 
      )
      , fullscreenDialog: true
    ));

    if(roomAdded != null && roomAdded) {
      _populateRooms(); 
    }

  }


  void _navigateToMessagesByRoom(RoomViewModel room, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => MessageListPage(room: room)
    ));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Rooms"), 
        actions: [
          GestureDetector(
            onTap: () {
              _navigateToAddRoomPage(context); 
            },
            child: Icon(Icons.add)
          )
        ],
      ), 
      body: RoomList(rooms: _rooms, onRoomSelected: (room) {
        // perform a navigation 
        _navigateToMessagesByRoom(room, context);
      })
    );
    
  }
}