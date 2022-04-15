import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyba_app/src/Usuarios/models/user_model.dart';

class UserRepository {
  Future<UserModel> createUser({required UserModel user}) async {
    try {
      // final sp = await SharedPreferences.getInstance();
      // sp.setString('user', jsonEncode(user.toJson()));
      sleep(const Duration(seconds: 4));
      return user;
    } catch (error) {
      developer.log(
        'Error creando el usuario',
        error: error,
      );
      rethrow;
    }
  }
}
