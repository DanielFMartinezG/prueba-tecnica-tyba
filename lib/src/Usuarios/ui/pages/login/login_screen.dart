import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_app/src/Usuarios/bloc/authentication/auth_bloc.dart';
import 'package:tyba_app/src/Usuarios/ui/pages/register/register_screen.dart';
import 'package:tyba_app/src/widgets/auth_button.dart';
import 'package:tyba_app/src/widgets/body_screen.dart';
import 'package:tyba_app/src/widgets/form_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BodyScreen(
      title: 'Inicio de sesión',
      body: [
        FormInput(
          inputTitle: 'Email',
          onChanged: (value) => email = value,
        ),
        FormInput(
          inputTitle: 'Contraseña',
          onChanged: (value) => password = value,
        ),
        AuthButton(
          callback: () {
            BlocProvider.of<AuthBloc>(context).add(Login(
              email: email,
              password: password,
            ));
          },
        ),
        const SizedBox(height: 8.0),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
          },
          child: const Text(
            'Registrar',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5CA8F5),
            ),
          ),
        )
      ],
    );
  }
}
