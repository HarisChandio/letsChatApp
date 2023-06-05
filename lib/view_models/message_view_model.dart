

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:lets_chat/models/message.dart';

class MessageViewModel {

  final Message message; 

  MessageViewModel({@required this.message});

  String get messageText {
    return message.messageText; 
  }

  String get username {
    return message.username; 
  }

  String get messageDate {
    return DateFormat("MM-dd-yyyy HH:mm:ss").format(message.dateCreated);
  }

}