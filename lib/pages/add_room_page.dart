

import 'package:flutter/material.dart';
import 'package:lets_chat/view_models/add_room_view_model.dart';
import 'package:provider/provider.dart';

class AddRoomPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(); 
  final _descriptionController = TextEditingController(); 

  AddRoomViewModel _addRoomVM; 

  void _saveRoom(BuildContext context) async {

    if(_formKey.currentState.validate()) {
      
      final title = _nameController.text; 
      final description = _descriptionController.text; 

      // save the room 
      final isSaved = await _addRoomVM.addRoom(title, description);
      if(isSaved) {
        Navigator.pop(context, isSaved); 
      }

    }

  }

  @override
  Widget build(BuildContext context) {

    _addRoomVM = Provider.of<AddRoomViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Room")
      ), 
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey, 
          child: Column(children: [
            TextFormField(
              validator: (value) {
                return value.isEmpty ? "title is required" : null; 
              },
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter title"
              ),
            ), 
            TextFormField(
              validator: (value) {
                return value.isEmpty ? "description is required" : null; 
              },
              controller: _descriptionController, 
              decoration: InputDecoration(
                hintText: "Enter description"
              ),
            ), 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Text("Save"), 
                textColor: Colors.white,
                color: Colors.grey,
                onPressed: () {
                  _saveRoom(context);
                },
              ),
            )
          ],)
        ),
      )
    );
    
  }
}