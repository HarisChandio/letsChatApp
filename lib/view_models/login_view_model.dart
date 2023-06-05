

import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel {

  Future<bool> login(String username) async {
    final sharedPreferences = await SharedPreferences.getInstance(); 
    return sharedPreferences.setString("username", username);
  }

}