import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_app/src/Usuarios/bloc/authentication/auth_bloc.dart';
import 'package:tyba_app/src/Usuarios/bloc/register/register_bloc.dart';
import 'package:tyba_app/src/Usuarios/models/user_model.dart';
import 'package:tyba_app/src/config/request_status.dart';
import 'package:tyba_app/src/widgets/action_button.dart';
import 'package:tyba_app/src/widgets/auth_button.dart';
import 'package:tyba_app/src/widgets/body_screen.dart';
import 'package:tyba_app/src/widgets/form_input.dart';
import 'package:tyba_app/src/widgets/loading.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? name;
  String? lastName;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BodyScreen(
      title: 'Registro de usuario',
      body: [
        FormInput(
          inputTitle: 'Nombre',
          onChanged: (value) => name = value,
        ),
        FormInput(
          inputTitle: 'Apellido',
          onChanged: (value) => lastName = value,
        ),
        FormInput(
          inputTitle: 'Email',
          onChanged: (value) => email = value,
        ),
        FormInput(
          inputTitle: 'Contraseña',
          onChanged: (value) => password = value,
        ),
        RegisterUserButton(
          callback: () {
            UserModel user = UserModel(
              name: name,
              lastName: lastName,
              email: email,
              password: password,
            );
            BlocProvider.of<RegisterBloc>(context).add(
              CreateUser(user: user),
            );
          },
        ),
      ],
    );
  }
}

class RegisterUserButton extends StatelessWidget {
  const RegisterUserButton({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final Function callback;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      switch (state.status) {
        case RequestStatus.noSubmitted:
          return ActionButton(
            title: 'Registrar',
            callback: callback,
          );
        case RequestStatus.failed:
          BlocProvider.of<RegisterBloc>(context).add(
            const ClearUser(),
          );
          return const Text('Error :(');
        case RequestStatus.success:
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            BlocProvider.of<AuthBloc>(context).add(
              Login(email: state.user?.email, password: state.user?.password),
            );
          });
          return AuthButton(
            callback: () {
              BlocProvider.of<AuthBloc>(context).add(Login(
                email: state.user?.email,
                password: state.user?.password,
              ));
            },
          );
        default:
          return const Loading(
            size: 25,
          );
      }
    });
  }
}
