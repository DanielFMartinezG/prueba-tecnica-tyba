part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent({required this.user});

  final UserModel user;
  @override
  List<Object> get props => [user];
}

class ClearUser extends RegisterEvent {
  const ClearUser({required UserModel user}) : super(user: user);
}

class CreateUser extends RegisterEvent {
  const CreateUser({required UserModel user}) : super(user: user);
}
