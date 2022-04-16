import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_app/src/Usuarios/bloc/authentication/auth_bloc.dart';
import 'package:tyba_app/src/config/request_status.dart';
import 'package:tyba_app/src/screens/home.dart';
import 'package:tyba_app/src/widgets/action_button.dart';
import 'package:tyba_app/src/widgets/loading.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.callback,
  }) : super(key: key);
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Unauthenticated) {
        return ActionButton(
          title: 'Iniciar sesión',
          callback: () => callback(),
        );
      } else if (state is Authenticated) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
            (route) => false,
          );
        });
        return const SizedBox(
          width: 25,
          child: Icon(
            Icons.check,
            color: Color(0xFF5CA8F5),
          ),
        );
      } else if (state.status == RequestStatus.inProgress) {
        return const Loading(
          size: 25,
        );
      } else if (state.status == RequestStatus.failed) {
        return Column(
          children: [
            ActionButton(
              title: 'Iniciar sesión',
              callback: () {
                BlocProvider.of<AuthBloc>(context).add(const ClearAuth());
                callback();
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Usuario no encontrado. :(',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        );
      }
      return const Text('Estado no controlado');
    });
  }
}
