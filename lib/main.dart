import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_app/src/Usuarios/bloc/authentication/auth_bloc.dart';
import 'package:tyba_app/src/Usuarios/bloc/register/register_bloc.dart';
import 'package:tyba_app/src/Usuarios/repository/user_repository.dart';
import 'package:tyba_app/src/app.dart';

void main() {
  runApp(const TybaApp());
}

class TybaApp extends StatelessWidget {
  const TybaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (_) => UserRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterBloc(
              repository: RepositoryProvider.of<UserRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              repository: RepositoryProvider.of<UserRepository>(context),
            )..add(const ClearAuth()),
          ),
        ],
        child: const App(),
      ),
    );
  }
}
