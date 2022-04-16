import 'dart:convert';
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyba_app/src/Usuarios/models/user_model.dart';

class UserRepository {
  Future<UserModel?> createUser({UserModel? user}) async {
    try {
      final sp = await SharedPreferences.getInstance();
      sp.setString('user', jsonEncode(user?.toJson()));
      await Future.delayed(const Duration(seconds: 2));
      return user;
    } catch (error) {
      developer.log(
        'Error creando el usuario',
        error: error,
      );
      rethrow;
    }
  }

  Future<UserModel?> loginUser({
    required String? email,
    required String? password,
  }) async {
    try {
      UserModel? user;
      final sp = await SharedPreferences.getInstance();
      final userStr = sp.getString('user');
      await Future.delayed(const Duration(seconds: 2));
      if (userStr != null) {
        UserModel? userFound = UserModel.fromJson(jsonDecode(userStr));
        if (userFound.email == email && userFound.password == password) {
          user = userFound;
        }
      }
      if (user == null) throw Exception('Usuario no encontrado');
      return user;
    } catch (error) {
      developer.log(
        'Error al autenticar el usuario',
        error: error,
      );
      rethrow;
    }
  }
}
