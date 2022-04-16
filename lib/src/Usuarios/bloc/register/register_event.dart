part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent({this.user});
  final UserModel? user;
  @override
  List get props => [user];
}

class ClearUser extends RegisterEvent {
  const ClearUser();
}

class CreateUser extends RegisterEvent {
  const CreateUser({required UserModel? user}) : super(user: user);
}
