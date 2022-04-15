import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_app/src/Usuarios/models/user_model.dart';
import 'package:tyba_app/src/Usuarios/repository/user_repository.dart';
import 'package:tyba_app/src/config/request_status.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required this.repository}) : super(const RegisterState());
  final UserRepository repository;

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    // if (event is ClearUser) {
    //   yield ClearUser(user: event.user);
    // }
    // else
    if (event is CreateUser) {
      yield* _createUser(event);
    }
  }

  Stream<RegisterState> _createUser(
    RegisterEvent event,
  ) async* {
    try {
      yield RegisterState.inProgress(
        user: UserModel(),
      );
      UserModel response = await repository.createUser(user: event.user);
      yield RegisterState.success(user: response);
    } catch (error) {
      yield RegisterState.failed(mssg: error.toString());
    }
  }
}
