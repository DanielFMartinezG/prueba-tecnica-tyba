import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_app/src/Usuarios/models/user_model.dart';
import 'package:tyba_app/src/Usuarios/repository/user_repository.dart';
import 'package:tyba_app/src/config/request_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(const Unauthenticated());
  final UserRepository repository;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Login) {
      yield* _login(event);
    } else {
      yield const Unauthenticated();
    }
  }

  Stream<AuthState> _login(
    AuthEvent event,
  ) async* {
    try {
      yield const AuthState.inProgress();
      UserModel? response = await repository.loginUser(
        email: event.email,
        password: event.password,
      );
      yield Authenticated(response);
    } catch (error) {
      yield AuthState.failed(mssg: error.toString());
    }
  }
}
