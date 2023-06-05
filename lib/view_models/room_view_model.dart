import 'package:flutter/foundation.dart';
import 'package:lets_chat/models/room.dart';

class RoomViewModel {
  final Room room;
  RoomViewModel({@required this.room});

  String get roomId {
    return room.roomId;
  }

  String get title {
    return room.title;
  }

  String get description {
    return room.description;
  }
}
