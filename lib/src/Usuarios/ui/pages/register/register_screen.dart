import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_app/src/Usuarios/bloc/register/register_bloc.dart';
import 'package:tyba_app/src/Usuarios/models/user_model.dart';
import 'package:tyba_app/src/config/request_status.dart';
import 'package:tyba_app/src/screens/home.dart';
import 'package:tyba_app/src/widgets/action_button.dart';
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
          name: name,
          lastName: lastName,
          email: email,
          password: password,
        ),
      ],
    );
  }
}

class RegisterUserButton extends StatelessWidget {
  const RegisterUserButton({
    Key? key,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
  }) : super(key: key);
  final String? name;
  final String? lastName;
  final String? email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        switch (state.status) {
          case RequestStatus.noSubmitted:
            return ActionButton(
              title: 'Registrar',
              callback: () {
                BlocProvider.of<RegisterBloc>(context).add(
                  CreateUser(
                    user: UserModel(
                      name: name,
                      lastName: lastName,
                      email: email,
                      password: password,
                    ),
                  ),
                );
              },
            );
          case RequestStatus.inProgress:
            return const Loading(
              size: 25,
            );
          case RequestStatus.success:
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              BlocProvider.of<RegisterBloc>(context).add(
                ClearUser(
                  user: UserModel(),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            });
            return Container(
              width: 25,
              child: const Icon(
                Icons.check,
                color: Color(0xFF5CA8F5),
              ),
            );
          case RequestStatus.failed:
            BlocProvider.of<RegisterBloc>(context).add(
              ClearUser(user: UserModel()),
            );
            return const Text('Error :(');
          default:
            return const Text('Estado no controlado');
        }
      },
    );
  }
}
