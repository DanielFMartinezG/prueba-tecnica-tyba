import 'package:flutter/material.dart';
import 'package:tyba_app/src/Usuarios/ui/pages/login/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
