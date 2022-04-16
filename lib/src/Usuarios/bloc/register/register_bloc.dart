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
    if (event is CreateUser) {
      yield* _createUser(event);
    } else {
      yield const RegisterState();
    }
  }

  Stream<RegisterState> _createUser(
    RegisterEvent event,
  ) async* {
    try {
      yield const RegisterState.inProgress();
      UserModel? response = await repository.createUser(user: event.user);
      yield RegisterState.success(user: response);
    } catch (error) {
      yield RegisterState.failed(mssg: error.toString());
    }
  }
}
