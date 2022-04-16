part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent({this.email, this.password});
  final String? email;
  final String? password;
  @override
  List get props => [email, password];
}

class Logout extends AuthEvent {
  const Logout();
}

class Login extends AuthEvent {
  const Login({String? email, String? password})
      : super(email: email, password: password);
}

class ClearAuth extends AuthEvent {
  const ClearAuth();
}
